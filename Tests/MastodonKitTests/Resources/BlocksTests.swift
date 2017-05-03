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

    func testAllWithRange() {
        let resource = Blocks.all(range: .max(id: 42, limit: nil))
        let expectedMaxID = URLQueryItem(name: "max_id", value: "42")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/blocks")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 1)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedMaxID))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
