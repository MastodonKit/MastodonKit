import XCTest
@testable import MastodonKit

class MutesTests: XCTestCase {
    func testAll() {
        let resource = Mutes.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/mutes")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testAllWithRange() {
        let resource = Mutes.all(range: .since(id: 15, limit: 37))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "15")
        let expectedLimit = URLQueryItem(name: "limit", value: "37")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/mutes")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
