import XCTest
@testable import MastodonKit

class FavouritesTests: XCTestCase {
    static var allTests = [
        ("testAll", testAll)
    ]

    func testAll() {
        let resource = Favourites.all()

        XCTAssertEqual(resource.path, "/api/v1/favourites")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]>.self)
    }
}
