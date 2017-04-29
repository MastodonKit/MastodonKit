import XCTest
@testable import MastodonKit

class BlocksTests: XCTestCase {
    func testAll() {
        let resource = Blocks.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/blocks")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
