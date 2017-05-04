import XCTest
@testable import MastodonKit

class PayloadTests: XCTestCase {
    func testParametersWithValidValue() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)

        // Items
        let expectedNumber = URLQueryItem(name: "number", value: "42")
        let expectedURL = URLQueryItem(name: "url", value: "https://mastodon.technology")

        XCTAssertEqual(payload.items?.count, 2)
        XCTAssertTrue(payload.items!.contains(expectedNumber))
        XCTAssertTrue(payload.items!.contains(expectedURL))

        // Data
        let expectedData = "number=42&url=https%3A//mastodon.technology".data(using: .utf8)

        XCTAssertEqual(payload.data, expectedData)
    }

    func testParametersWithNilValue() {
        let payload = Payload.parameters(nil)

        XCTAssertNil(payload.items)
        XCTAssertNil(payload.data)
    }

    func testImageWithValidValue() {
        let imageData = Data()

        let payload = Payload.image(imageData)

        XCTAssertNil(payload.items)
        XCTAssertEqual(payload.data, imageData)
    }

    func testImageWithNilValue() {
        let payload = Payload.image(nil)

        XCTAssertNil(payload.items)
        XCTAssertNil(payload.data)
    }

    func testEmpty() {
        let payload = Payload.empty

        XCTAssertNil(payload.items)
        XCTAssertNil(payload.data)
    }
}
