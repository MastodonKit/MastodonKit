import XCTest
@testable import MastodonKit

class StringTests: XCTestCase {
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
