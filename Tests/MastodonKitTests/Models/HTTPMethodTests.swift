import XCTest
@testable import MastodonKit

class HTTPMethodTests: XCTestCase {
    static var allTests = [
        ("testGet", testGet),
        ("testPost", testPost),
        ("testDelete", testDelete),
        ("testPatch", testPatch)
    ]

    func testGet() {
        XCTAssertEqual(HTTPMethod.get.stringValue, "GET")
    }

    func testPost() {
        XCTAssertEqual(HTTPMethod.post.stringValue, "POST")
    }

    func testDelete() {
        XCTAssertEqual(HTTPMethod.delete.stringValue, "DELETE")
    }

    func testPatch() {
        XCTAssertEqual(HTTPMethod.patch.stringValue, "PATCH")
    }
}
