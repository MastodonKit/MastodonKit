import XCTest
@testable import MastodonKit

class BlocksTests: XCTestCase {
    func testAll() {
        let resource = Blocks.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/blocks")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
