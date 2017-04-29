import XCTest
@testable import MastodonKit

class FavouritesTests: XCTestCase {
    func testAll() {
        let resource = Favourites.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/favourites")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
