import XCTest
@testable import MastodonKit

class MutesTests: XCTestCase {
    func testAll() {
        let resource = Mutes.all()

        XCTAssertEqual(resource.path, "/api/v1/mutes")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
