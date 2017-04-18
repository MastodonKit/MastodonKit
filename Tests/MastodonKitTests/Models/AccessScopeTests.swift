import XCTest
@testable import MastodonKit

class AccessScopeTests: XCTestCase {
    static var allTests = [
        ("testRead", testRead),
        ("testWrite", testWrite),
        ("testFollow", testFollow),
        ("testInvalidType", testInvalidType)
    ]

    func testRead() {
        let type = AccessScope(string: "read")

        XCTAssertEqual(type, AccessScope.read)
        XCTAssertEqual(type.stringValue, "read")
    }

    func testWrite() {
        let type = AccessScope(string: "write")

        XCTAssertEqual(type, AccessScope.write)
        XCTAssertEqual(type.stringValue, "write")
    }

    func testFollow() {
        let type = AccessScope(string: "follow")

        XCTAssertEqual(type, AccessScope.follow)
        XCTAssertEqual(type.stringValue, "follow")
    }

    func testInvalidType() {
        let type = AccessScope(string: "foobar")

        XCTAssertEqual(type, AccessScope.read)
        XCTAssertEqual(type.stringValue, "read")
    }
}
