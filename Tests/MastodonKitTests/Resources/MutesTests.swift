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
}
