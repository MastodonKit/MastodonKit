import XCTest
@testable import MastodonKit

class BlocksTests: XCTestCase {
    func testAll() {
        let resource = Blocks.all()

        XCTAssertEqual(resource.path, "/api/v1/blocks")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]>.self)
    }
}
