import XCTest
@testable import MastodonKit

class HTTPMethodTests: XCTestCase {
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
