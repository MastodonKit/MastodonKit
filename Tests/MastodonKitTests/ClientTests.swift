//
//  ClientTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ClientInitializationTests: XCTestCase {
    func testClientInitializationWithAccessToken() {
        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "foo")

        XCTAssertNotNil(client)
    }

    func testClientInitializationWithoutAccessToken() {
        let client = Client(baseURL: "https://my.mastodon.instance/")

        XCTAssertNotNil(client)
    }

    func testClientAccessTokenConfiguration() {
        let client = Client(baseURL: "https://my.mastodon.instance/")

        XCTAssertNil(client.accessToken)

        client.accessToken = "bar"
        XCTAssertEqual(client.accessToken, "bar")
    }
}

class ClientInitializationWithInvalidURLTests: XCTestCase {
    func testClientInitializationWithAccessToken() {
        let client = Client(baseURL: "42 is the answer but isn't a valid URL")
        var passedError: Error?

        let fakeSession = URLSessionFake()
        client.session = fakeSession

        client.run(Timelines.home()) { _, error in
            passedError = error
        }

        XCTAssertEqual(passedError?.localizedDescription, ClientError.malformedURL.localizedDescription)
    }
}

class ClientRunTests: XCTestCase {
    var fakeSession: URLSessionFake?
    var passedModel: [Status]?
    var passedError: Error?

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "foo")

        fakeSession = URLSessionFake()
        client.session = fakeSession!

        client.run(Timelines.home()) { model, error in
            self.passedModel = model
            self.passedError = error
        }
    }

    func testCallsResume() {
        XCTAssertTrue(fakeSession!.lastReturnedDataTask!.didCallResume)
    }

    func testPassedRequest() {
        let request = fakeSession?.lastRequest

        XCTAssertEqual(request?.url?.absoluteString, "https://my.mastodon.instance/api/v1/timelines/home")
        XCTAssertEqual(request?.url?.host, "my.mastodon.instance")
        XCTAssertEqual(request?.url?.path, "/api/v1/timelines/home")
        XCTAssertEqual(request?.timeoutInterval, 30)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Authorization"), "Bearer foo")
    }

    func testDataTaskCompletionBlockWithError() {
        let error = NSError(domain: "fake error", code: 42, userInfo: nil)

        fakeSession?.lastCompletionHandler?(nil, nil, error)

        XCTAssertNil(passedModel)
        XCTAssertEqual(passedError?.localizedDescription, error.localizedDescription)
    }

    func testDataTaskCompletionBlockWithInvalidData() {
        let data = Data()

        fakeSession?.lastCompletionHandler?(data, nil, nil)

        XCTAssertNil(passedModel)
        XCTAssertEqual(passedError?.localizedDescription, ClientError.dataError.localizedDescription)
    }

    func testDataTaskCompletionBlockWithkMastodonError() {
        let fixture = try! Fixture.load(fileName: "Fixtures/RequestError.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let response = HTTPURLResponse(
            url:URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 401,
            httpVersion: nil,
            headerFields: nil)

        fakeSession?.lastCompletionHandler?(data, response, nil)

        XCTAssertNil(passedModel)
        XCTAssertEqual(passedError?.localizedDescription, ClientError.mastodonError("yes, it's an error.").localizedDescription)
    }

    func testDataTaskCompletionBlockWithSuccess() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        fakeSession?.lastCompletionHandler?(data, response, nil)

        XCTAssertEqual(passedModel?.count, 2)
        XCTAssertNil(passedError)
    }
}

class ClientRunWithoutAccessTokenTests: XCTestCase {
    var fakeSession: URLSessionFake?

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/")

        fakeSession = URLSessionFake()
        client.session = fakeSession!

        client.run(Timelines.public(local: true)) { _, _ in }
    }

    func testCallsResume() {
        XCTAssertTrue(fakeSession!.lastReturnedDataTask!.didCallResume)
    }

    func testPassedRequest() {
        let request = fakeSession?.lastRequest

        XCTAssertEqual(request?.url?.absoluteString, "https://my.mastodon.instance/api/v1/timelines/public?local=true")
        XCTAssertEqual(request?.url?.host, "my.mastodon.instance")
        XCTAssertEqual(request?.url?.path, "/api/v1/timelines/public")
        XCTAssertEqual(request?.timeoutInterval, 30)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertNil(request?.value(forHTTPHeaderField: "Authorization"))
    }
}

class ClientRunWithPostAndHTTPBodyTests: XCTestCase {
    var fakeSession: URLSessionFake?

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "foo")

        fakeSession = URLSessionFake()
        client.session = fakeSession!

        client.run(Statuses.create(status: "Hi there!", replyToID: 42, sensitive: false, visibility: .public) ) { _, _ in }
    }

    func testPassedRequest() {
        let request = fakeSession?.lastRequest

        XCTAssertEqual(request?.url?.absoluteString, "https://my.mastodon.instance/api/v1/statuses")
        XCTAssertEqual(request?.url?.host, "my.mastodon.instance")
        XCTAssertEqual(request?.url?.path, "/api/v1/statuses")
        XCTAssertEqual(request?.timeoutInterval, 30)
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Authorization"), "Bearer foo")

        XCTAssertEqual(request?.httpMethod, "POST")
        XCTAssertNil(request?.url?.query)

        let httyBodyString = String(data: request!.httpBody!, encoding: .utf8)!

        XCTAssertTrue(httyBodyString.contains("status=Hi%20there%21"))
        XCTAssertTrue(httyBodyString.contains("visibility=public"))
        XCTAssertTrue(httyBodyString.contains("in_reply_to_id=42"))
    }
}

class ClientRunWithGetAndQueryItemsTests: XCTestCase {
    var fakeSession: URLSessionFake?

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "bär")

        fakeSession = URLSessionFake()
        client.session = fakeSession!

        client.run(Search.search(query: "MastodonKit", resolve: false)) { _, _ in }
    }

    func testPassedRequest() {
        let request = fakeSession?.lastRequest!

        XCTAssertEqual(request?.url?.absoluteString, "https://my.mastodon.instance/api/v1/search?q=MastodonKit")
        XCTAssertEqual(request?.url?.host, "my.mastodon.instance")
        XCTAssertEqual(request?.url?.path, "/api/v1/search")
        XCTAssertEqual(request?.timeoutInterval, 30)
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Authorization"), "Bearer bär")

        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertNotNil(request?.url?.query)
        XCTAssertNil(request!.httpBody)
    }
}
