import XCTest
@testable import MastodonKit

class FoundationTests: XCTestCase {
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

    func testDateFromMastodonWithValidDate() {
        let date = DateFormatter.mastodonFormatter.date(from: "2016-12-20T13:14:15.132Z")

        XCTAssertEqual(date?.timeIntervalSince1970, 1482239655.132)
    }

    func testDateFromMastodonWithInvalidDate() {
        let date = DateFormatter.mastodonFormatter.date(from: "2016-12-20")
        
        XCTAssertNil(date)
    }

    func testStringInitializerFromOptionalString() {
        let invalidString: String? = nil

        XCTAssertNil(String(optional: invalidString))
        XCTAssertEqual(String(optional: "foo"), "foo")
    }

    func testStringInitializerFromOptionalInteger() {
        let invalidInteger: Int? = nil

        XCTAssertNil(String(optional: invalidInteger))
        XCTAssertEqual(String(optional: 42), "42")
    }

    func testStringInitializerFromOptionalBoolean() {
        let invalidBoolean: Bool? = nil

        XCTAssertNil(String(optional: invalidBoolean))
        XCTAssertEqual(String(optional: true), "true")
        XCTAssertEqual(String(optional: false), "false")
    }
}
