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

    func testAllWithRange() {
        let resource = Favourites.all(range: .since(id: 42, limit: nil))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "42")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/favourites")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 1)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedSinceID))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
