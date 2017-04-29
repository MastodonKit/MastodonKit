import XCTest
@testable import MastodonKit

class TimelinesTests: XCTestCase {
    func testHomeTimeline() {
        let resource = Timelines.home()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/home")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testPublicTimelineLocal() {
        let resource = Timelines.public(local: true)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testPublicTimelineFederated() {
        let resource = Timelines.public()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 0)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimelineLocal() {
        let resource = Timelines.tag("mastodonkit", local: true)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimelineFederated() {
        let resource = Timelines.tag("mastodonkit")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 0)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
