import XCTest
@testable import MastodonKit

class TimelinesTests: XCTestCase {
    func testHomeTimeline() {
        let resource = Timelines.home()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/home")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testPublicTimelineLocal() {
        let resource = Timelines.public(local: true)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertTrue(resource.method.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testPublicTimelineFederated() {
        let resource = Timelines.public()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 0)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimelineLocal() {
        let resource = Timelines.tag("mastodonkit", local: true)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertTrue(resource.method.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimelineFederated() {
        let resource = Timelines.tag("mastodonkit")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 0)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
