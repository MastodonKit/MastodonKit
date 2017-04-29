import XCTest
@testable import MastodonKit

class FavouritesTests: XCTestCase {
    func testAll() {
        let resource = Favourites.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/favourites")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
