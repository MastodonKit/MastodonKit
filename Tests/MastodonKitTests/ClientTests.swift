//
//  ClientTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
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
        var client = Client(baseURL: "https://my.mastodon.instance/")

        XCTAssertNil(client.accessToken)

        client.accessToken = "bar"
        XCTAssertEqual(client.accessToken, "bar")
    }
}

class ClientInitializationWithInvalidURLTests: XCTestCase {
    func testClientInitializationWithAccessToken() {
        let mockSession = MockURLSession()
        let client = Client(baseURL: "42 is the answer but isn't a valid URL", session: mockSession)
        var passedError: Error?

        client.run(Timelines.home()) { result in
            passedError = result.error
        }

        XCTAssertEqual(passedError?.localizedDescription, ClientError.malformedURL.localizedDescription)
    }
}

class ClientRunTests: XCTestCase {
    let mockSession = MockURLSession()
    var result: Result<[Status]>?

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "foo", session: mockSession)
        let request = Timelines.home()

        client.run(request) { result in
            self.result = result
        }
    }

    func testCallsResume() {
        XCTAssertTrue(mockSession.lastReturnedDataTask!.didCallResume)
    }

    func testPassedRequest() {
        let request = mockSession.lastRequest

        XCTAssertEqual(request?.url?.absoluteString, "https://my.mastodon.instance/api/v1/timelines/home")
        XCTAssertEqual(request?.url?.host, "my.mastodon.instance")
        XCTAssertEqual(request?.url?.path, "/api/v1/timelines/home")
        XCTAssertEqual(request?.timeoutInterval, 30)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Authorization"), "Bearer foo")
    }

    func testDataTaskCompletionBlockWithError() {
        let mockError = NSError(domain: "mock error", code: 42, userInfo: nil)

        mockSession.lastCompletionHandler?(nil, nil, mockError)

        XCTAssertEqual(result?.error?.localizedDescription, mockError.localizedDescription)
    }

    func testDataTaskCompletionBlockWithMalformedJSON() {
        let mockData = Data()

        mockSession.lastCompletionHandler?(mockData, nil, nil)

        XCTAssertEqual(result?.error?.localizedDescription, ClientError.malformedJSON.localizedDescription)
    }

    func testDataTaskCompletionBlockWithMastodonError() {
        let fixture = try! Fixture.load(fileName: "Fixtures/RequestError.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 401,
            httpVersion: nil,
            headerFields: nil)

        mockSession.lastCompletionHandler?(data, response, nil)

        XCTAssertEqual(result?.error?.localizedDescription, ClientError.mastodonError("yes, it's an error.").localizedDescription)
    }

    func testDataTaskCompletionBlockWithInvalidModel() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Account.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil)

        mockSession.lastCompletionHandler?(data, response, nil)

        XCTAssertEqual(result?.error?.localizedDescription, ClientError.invalidModel.localizedDescription)
    }

    func testDataTaskCompletionBlockWithSuccessWithoutHeaderLink() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        mockSession.lastCompletionHandler?(data, response, nil)

        XCTAssertEqual(result?.value?.count, 2)
        XCTAssertNil(result?.pagination)
    }

    func testDataTaskCompletionBlockWithSuccessWithHeaderLink() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=123>; rel=\"prev\"",
            "<https://mastodon.technology/api/v1/timelines/home?limit=52&max_id=321>; rel=\"next\""
        ].joined(separator: ",")

        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: ["Link": links]
        )

        mockSession.lastCompletionHandler?(data, response, nil)

        XCTAssertEqual(result?.value?.count, 2)
        XCTAssertNotNil(result?.pagination)
    }
}

class ClientRunWithoutAccessTokenTests: XCTestCase {
    let mockSession = MockURLSession()

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", session: mockSession)
        let request = Timelines.public(local: true)

        client.run(request) { _ in }
    }

    func testCallsResume() {
        XCTAssertTrue(mockSession.lastReturnedDataTask!.didCallResume)
    }

    func testPassedRequest() {
        let request = mockSession.lastRequest

        XCTAssertEqual(request?.url?.absoluteString, "https://my.mastodon.instance/api/v1/timelines/public?local=true")
        XCTAssertEqual(request?.url?.host, "my.mastodon.instance")
        XCTAssertEqual(request?.url?.path, "/api/v1/timelines/public")
        XCTAssertEqual(request?.timeoutInterval, 30)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertNil(request?.value(forHTTPHeaderField: "Authorization"))
    }
}

class ClientRunWithPostAndHTTPBodyTests: XCTestCase {
    let mockSession = MockURLSession()

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "foo", session: mockSession)
        let request = Statuses.create(status: "Hi there!", replyToID: 42, sensitive: false, visibility: .public)

        client.run(request) { _ in }
    }

    func testPassedRequest() {
        let request = mockSession.lastRequest

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
    let mockSession = MockURLSession()

    override func setUp() {
        super.setUp()

        let client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "bär", session: mockSession)
        let request = Search.search(query: "MastodonKit", resolve: false)

        client.run(request) { _ in }
    }

    func testPassedRequest() {
        let request = mockSession.lastRequest

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
