import XCTest
@testable import MastodonKit

class MastodonClientTests: XCTestCase {
    func testURLComponentsWithBaseURL() {
        let resource = Resource<String>(path: "/string") { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", resource: resource)

        XCTAssertEqual(components.url, URL(string: "https://mastodon.technology/string"))
    }

    func testURLComponentsWithBaseURLAndQueryItems() {
        let queryItems = ["a": "0", "b": "1"].flatMap(toQueryItem)
        let resource = Resource<String>(path: "/string", parameters: queryItems) { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", resource: resource)

        XCTAssertEqual(components.url, URL(string: "https://mastodon.technology/string?b=1&a=0"))
    }
}
