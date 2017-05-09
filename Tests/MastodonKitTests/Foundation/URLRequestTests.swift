import XCTest
@testable import MastodonKit

class URLRequestTests: XCTestCase {
    func testRequestWithValidHTTPBody() {
        let url = URL(string: "https://mastodon.technology")!
        let mediaData = Data()
        let method = HTTPMethod.post(Payload.media(.gif(mediaData)))
        let resource = Resource<String>(path: "/string", method: method) { _ in return "string" }

        let request = URLRequest(url: url, resource: resource, accessToken: nil)

        XCTAssertEqual(request.timeoutInterval, 30)
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertNotNil(request.httpBody)

        XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"))
        XCTAssertNotNil(request.value(forHTTPHeaderField: "Content-Type"))
    }

    func testRequestWithoutHTTPBody() {
        let url = URL(string: "https://mastodon.technology")!
        let resource = Resource<String>(path: "/string", method: HTTPMethod.get(.empty)) { _ in return "string" }

        let request = URLRequest(url: url, resource: resource, accessToken: nil)

        XCTAssertEqual(request.timeoutInterval, 30)
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNil(request.httpBody)

        XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"))
        XCTAssertNil(request.value(forHTTPHeaderField: "Content-Type"))
    }

    func testRequestWithAccessToken() {
        let url = URL(string: "https://mastodon.technology")!
        let resource = Resource<String>(path: "/string", method: HTTPMethod.get(.empty)) { _ in return "string" }

        let request = URLRequest(url: url, resource: resource, accessToken: "foo")

        XCTAssertEqual(request.timeoutInterval, 30)
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNil(request.httpBody)

        XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Bearer foo")
        XCTAssertNil(request.value(forHTTPHeaderField: "Content-Type"))
    }
}
