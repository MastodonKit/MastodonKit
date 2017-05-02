import XCTest
@testable import MastodonKit

class URLComponentsTests: XCTestCase {
    func testURLComponentsWithValidBaseURL() {
        let resource = Resource<String>(path: "/string") { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", resource: resource)

        XCTAssertEqual(components?.url, URL(string: "https://mastodon.technology/string"))
    }

    func testURLComponentsWithInvalidBaseURL() {
        let resource = Resource<String>(path: "/string") { _ in return "string" }
        let components = URLComponents(baseURL: "this is an invalid base url", resource: resource)

        XCTAssertNil(components)
    }

    func testURLComponentsWithInValidResourcePath() {
        let resource = Resource<String>(path: "invalid endpoint") { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", resource: resource)

        XCTAssertNil(components)
    }

    func testURLComponentsWithBaseURLAndQueryItems() {
        let parameters = [
            Parameter(name: "a", value: "0"),
            Parameter(name: "b", value: "1")
        ]

        let resource = Resource<String>(path: "/string", method: .get(Payload.parameters(parameters))) { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", resource: resource)

        XCTAssertEqual(components?.url, URL(string: "https://mastodon.technology/string?a=0&b=1"))
    }
}
