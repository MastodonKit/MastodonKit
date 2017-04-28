import XCTest
@testable import MastodonKit

class HTTPMethodTests: XCTestCase {
    func testGet()  {
        let dictionary: Parameters = ["number": String(42), "url": "https://mastodon.technology", "nilValue": nil]
        let payload = Payload.parameters(dictionary)
        let method = HTTPMethod.get(payload)

        let expectedNumber = URLQueryItem(name: "number", value: "42")
        let expectedURL = URLQueryItem(name: "url", value: "https://mastodon.technology")

        XCTAssertEqual(method.name, "GET")

        XCTAssertEqual(method.queryItems?.count, 2)
        XCTAssertTrue(method.queryItems!.contains(expectedNumber))
        XCTAssertTrue(method.queryItems!.contains(expectedURL))

        XCTAssertNil(method.httpBody)
    }

    func testPost()  {
        let dictionary: Parameters = ["number": String(42), "url": "https://mastodon.technology", "nilValue": nil]
        let payload = Payload.parameters(dictionary)
        let method = HTTPMethod.post(payload)

        let expectedData = "number=42&url=https://mastodon.technology".data(using: .utf8)

        XCTAssertEqual(method.name, "POST")

        XCTAssertNil(method.queryItems)

        XCTAssertEqual(method.httpBody, expectedData)
    }

    func testPatch()  {
        let dictionary: Parameters = ["number": String(42), "url": "https://mastodon.technology", "nilValue": nil]
        let payload = Payload.parameters(dictionary)
        let method = HTTPMethod.patch(payload)

        let expectedData = "number=42&url=https://mastodon.technology".data(using: .utf8)

        XCTAssertEqual(method.name, "PATCH")

        XCTAssertNil(method.queryItems)

        XCTAssertEqual(method.httpBody, expectedData)
    }

    func testDelete()  {
        let method = HTTPMethod.delete

        XCTAssertEqual(method.name, "DELETE")

        XCTAssertNil(method.queryItems)
        XCTAssertNil(method.httpBody)
    }
}
