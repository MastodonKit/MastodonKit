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

class ClientRunTests: XCTestCase {
    var client: Client?
    var fakeSession: URLSessionFake?
    var passedModel: [Status]?
    var passedError: Error?

    override func setUp() {
        super.setUp()

        client = Client(baseURL: "https://my.mastodon.instance/", accessToken: "foo")

        fakeSession = URLSessionFake()
        client?.session = fakeSession!

        client?.run(Timelines.home()) { model, error in
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
        let response = HTTPURLResponse(url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!, statusCode: 401, httpVersion: nil, headerFields: nil)

        fakeSession?.lastCompletionHandler?(data, response, nil)

        XCTAssertNil(passedModel)
        XCTAssertEqual(passedError?.localizedDescription, ClientError.mastodonError("yes, it's an error.").localizedDescription)
    }

    func testDataTaskCompletionBlockWithSuccess() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let data = try! JSONSerialization.data(withJSONObject: fixture, options: .prettyPrinted)
        let response = HTTPURLResponse(url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!, statusCode: 200, httpVersion: nil, headerFields: nil)

        fakeSession?.lastCompletionHandler?(data, response, nil)

        XCTAssertEqual(passedModel?.count, 2)
        XCTAssertNil(passedError)
    }
}
