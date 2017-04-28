import XCTest
@testable import MastodonKit

class PayloadTests: XCTestCase {
    func testParametersWithValidValue() {
        let dictionary: Parameters = ["number": String(42), "url": "https://mastodon.technology", "nilValue": nil]
        let payload = Payload.parameters(dictionary)

        let expectedNumber = URLQueryItem(name: "number", value: "42")
        let expectedURL = URLQueryItem(name: "url", value: "https://mastodon.technology")
        let expectedData = "number=42&url=https://mastodon.technology".data(using: .utf8)

        XCTAssertEqual(payload.items?.count, 2)
        XCTAssertTrue(payload.items!.contains(expectedNumber))
        XCTAssertTrue(payload.items!.contains(expectedURL))

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
