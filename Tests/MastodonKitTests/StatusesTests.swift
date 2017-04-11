import XCTest
@testable import MastodonKit

class StatusesTests: XCTestCase {
    static var allTests = [
        ("testStatusByID", testStatus),
        ("testContext", testContext),
        ("testCard", testCard),
        ("testRebloggedBy", testRebloggedBy),
        ("testFavouritedBy", testFavouritedBy)
    ]

    func testStatus() {
        let resource = Statuses.status(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testContext() {
        let resource = Statuses.context(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/context")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testCard() {
        let resource = Statuses.card(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/card")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testRebloggedBy() {
        let resource = Statuses.rebloggedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblogged_by")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testFavouritedBy() {
        let resource = Statuses.favouritedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourited_by")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }
}
