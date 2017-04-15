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
        let method = HTTPMethod.get
        XCTAssertEqual(method.toString(), "GET")
    }

    func testPost() {
        let method = HTTPMethod.post
        XCTAssertEqual(method.toString(), "POST")
    }

    func testDelete() {
        let method = HTTPMethod.delete
        XCTAssertEqual(method.toString(), "DELETE")
    }

    func testPatch() {
        let method = HTTPMethod.patch
        XCTAssertEqual(method.toString(), "PATCH")
    }
}
