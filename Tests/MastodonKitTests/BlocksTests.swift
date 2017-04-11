import XCTest
@testable import MastodonKit

class BlocksTests: XCTestCase {
    static var allTests = [
        ("testAll", testAll)
    ]

    func testAll() {
        let resource = Blocks.all()

        XCTAssertEqual(resource.path, "/api/v1/blocks")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }
}
