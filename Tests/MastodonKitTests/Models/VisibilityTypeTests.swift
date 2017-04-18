import XCTest
@testable import MastodonKit

class VisibilityTypeTests: XCTestCase {
    func testPublic() {
        let type = VisibilityType(string: "public")

        XCTAssertEqual(type, VisibilityType.public)
        XCTAssertEqual(type.stringValue, "public")
    }

    func testUnlisted() {
        let type = VisibilityType(string: "unlisted")

        XCTAssertEqual(type, VisibilityType.unlisted)
        XCTAssertEqual(type.stringValue, "unlisted")
    }

    func testPrivate() {
        let type = VisibilityType(string: "private")

        XCTAssertEqual(type, VisibilityType.private)
        XCTAssertEqual(type.stringValue, "private")
    }

    func testDirect() {
        let type = VisibilityType(string: "direct")

        XCTAssertEqual(type, VisibilityType.direct)
        XCTAssertEqual(type.stringValue, "direct")
    }

    func testInvalidType() {
        let type = VisibilityType(string: "foobar")

        XCTAssertEqual(type, VisibilityType.unlisted)
        XCTAssertEqual(type.stringValue, "unlisted")
    }
}
