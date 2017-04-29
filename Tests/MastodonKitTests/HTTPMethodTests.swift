import XCTest
@testable import MastodonKit

class HTTPMethodTests: XCTestCase {
    func testGet()  {
        let dictionary: Parameters = [
            "number": String(42),
            "url": "https://mastodon.technology",
            "nilValue": nil
        ]

        let payload = Payload.parameters(dictionary)
        let method = HTTPMethod.get(payload)

        // Name
        XCTAssertEqual(method.name, "GET")

        // Query items
        let expectedNumber = URLQueryItem(name: "number", value: "42")
        let expectedURL = URLQueryItem(name: "url", value: "https://mastodon.technology")

        XCTAssertEqual(method.queryItems?.count, 2)
        XCTAssertTrue(method.queryItems!.contains(expectedNumber))
        XCTAssertTrue(method.queryItems!.contains(expectedURL))

        // HTTP body
        XCTAssertNil(method.httpBody)
    }

    func testPost()  {
        let dictionary: Parameters = [
            "number": String(42),
            "url": "https://mastodon.technology",
            "nilValue": nil
        ]

        let payload = Payload.parameters(dictionary)
        let method = HTTPMethod.post(payload)

        // Name
        XCTAssertEqual(method.name, "POST")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        let expectedData = "number=42&url=https://mastodon.technology".data(using: .utf8)

        XCTAssertEqual(method.httpBody, expectedData)
    }

    func testPatch()  {
        let dictionary: Parameters = [
            "number": String(42),
            "url": "https://mastodon.technology",
            "nilValue": nil
        ]

        let payload = Payload.parameters(dictionary)
        let method = HTTPMethod.patch(payload)

        // Name
        XCTAssertEqual(method.name, "PATCH")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        let expectedData = "number=42&url=https://mastodon.technology".data(using: .utf8)

        XCTAssertEqual(method.httpBody, expectedData)
    }

    func testDelete()  {
        let method = HTTPMethod.delete

        // Name
        XCTAssertEqual(method.name, "DELETE")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNil(method.httpBody)
    }
}
