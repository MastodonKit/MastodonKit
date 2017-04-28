import XCTest
@testable import MastodonKit

class FavouritesTests: XCTestCase {
    func testAll() {
        let resource = Favourites.all()

        XCTAssertEqual(resource.path, "/api/v1/favourites")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
