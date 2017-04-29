import XCTest
@testable import MastodonKit

class TimelinesTeSearchTestssts: XCTestCase {
    func testSearchWithoutResolve() {
        let resource = Search.search(query: "mastodonkit")
        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/search")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 1)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedQuery))

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
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 2)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedResolve))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Results?>.self)
    }
}
