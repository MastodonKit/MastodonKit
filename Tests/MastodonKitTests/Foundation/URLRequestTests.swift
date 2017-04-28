import XCTest
@testable import MastodonKit

class URLRequestTests: XCTestCase {
    func testRequestWithValidHTTPBody() {
        let url = URL(string: "https://mastodon.technology")!
        let data = Data()
        let method = HTTPMethod.post(Payload.image(data))
        let resource = Resource<String>(path: "/string", method: method) { _ in return "string" }

        let request = URLRequest(url: url, resource: resource, accessToken: nil)

        XCTAssertEqual(request.timeoutInterval, 30)
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertEqual(request.httpBody, data)

        XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/x-www-form-urlencoded; charset=utf-8")
    }

    func testRequestWithoutHTTPBody() {
        let url = URL(string: "https://mastodon.technology")!
        let resource = Resource<String>(path: "/string", method: HTTPMethod.get(Payload.empty)) { _ in return "string" }

        let request = URLRequest(url: url, resource: resource, accessToken: nil)

        XCTAssertEqual(request.timeoutInterval, 30)
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNil(request.httpBody)

        XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/x-www-form-urlencoded; charset=utf-8")
    }

    func testRequestWithAccessToken() {
        let url = URL(string: "https://mastodon.technology")!
        let resource = Resource<String>(path: "/string", method: HTTPMethod.get(Payload.empty)) { _ in return "string" }

        let request = URLRequest(url: url, resource: resource, accessToken: "foo")

        XCTAssertEqual(request.timeoutInterval, 30)
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNil(request.httpBody)

        XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Bearer foo")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/x-www-form-urlencoded; charset=utf-8")
    }
}
