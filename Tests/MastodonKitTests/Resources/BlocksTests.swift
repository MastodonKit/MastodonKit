import XCTest
@testable import MastodonKit

class BlocksTests: XCTestCase {
    func testAll() {
        let resource = Blocks.all()

        XCTAssertEqual(resource.path, "/api/v1/blocks")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
