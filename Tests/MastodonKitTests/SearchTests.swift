import XCTest
@testable import MastodonKit

class TimelinesTeSearchTestssts: XCTestCase {
    static var allTests = [
        ("testSearchWithoutResolve", testSearchWithoutResolve),
        ("testSearchWithResolve", testSearchWithResolve)
    ]

    func testSearchWithoutResolve() {
        let resource = Search.search(query: "mastodonkit")

        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")
        let expectedResolve = URLQueryItem(name: "resolve", value: "false")

        XCTAssertEqual(resource.path, "/api/v1/search")
        XCTAssertEqual(resource.httpMethod, "GET")

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedQuery))
        XCTAssertTrue(resource.parameters!.contains(expectedResolve))

        XCTAssertNotNil(resource.parse)
    }

    func testSearchWithResolve() {
        let resource = Search.search(query: "mastodonkit", resolve: true)

        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")
        let expectedResolve = URLQueryItem(name: "resolve", value: "true")

        XCTAssertEqual(resource.path, "/api/v1/search")
        XCTAssertEqual(resource.httpMethod, "GET")

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedQuery))
        XCTAssertTrue(resource.parameters!.contains(expectedResolve))

        XCTAssertNotNil(resource.parse)
    }
}
