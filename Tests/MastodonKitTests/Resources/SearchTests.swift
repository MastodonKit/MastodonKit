import XCTest
@testable import MastodonKit

class TimelinesTeSearchTestssts: XCTestCase {
    func testSearchWithoutResolve() {
        let resource = Search.search(query: "mastodonkit")
        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/search")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 1)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedQuery))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Results?>.self)
    }

    func testSearchWithResolve() {
        let resource = Search.search(query: "mastodonkit", resolve: true)
        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")
        let expectedResolve = URLQueryItem(name: "resolve", value: "true")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/search")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedResolve))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Results?>.self)
    }
}
