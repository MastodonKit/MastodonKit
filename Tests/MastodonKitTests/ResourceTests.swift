import XCTest
@testable import MastodonKit

class ResourceTests: XCTestCase {
    func testHTTPMethodGet() {
        XCTAssertEqual(Resource<Any>.HTTPMethod.get.rawValue, "GET")
    }

    func testHTTPMethodPost() {
        XCTAssertEqual(Resource<Any>.HTTPMethod.post.rawValue, "POST")
    }

    func testHTTPMethodDelete() {
        XCTAssertEqual(Resource<Any>.HTTPMethod.delete.rawValue, "DELETE")
    }

    func testHTTPMethodPatch() {
        XCTAssertEqual(Resource<Any>.HTTPMethod.patch.rawValue, "PATCH")
    }
}
