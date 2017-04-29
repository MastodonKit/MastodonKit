import XCTest
@testable import MastodonKit

class MutesTests: XCTestCase {
    func testAll() {
        let resource = Mutes.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/mutes")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
