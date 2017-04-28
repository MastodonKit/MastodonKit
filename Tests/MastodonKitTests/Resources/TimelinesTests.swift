import XCTest
@testable import MastodonKit

class TimelinesTests: XCTestCase {
    func testHomeTimeline() {
        let resource = Timelines.home()

        XCTAssertEqual(resource.path, "/api/v1/timelines/home")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testPublicTimelineLocal() {
        let resource = Timelines.public(local: true)

        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testPublicTimelineFederated() {
        let resource = Timelines.public()

        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 0)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimelineLocal() {
        let resource = Timelines.tag("mastodonkit", local: true)

        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimelineFederated() {
        let resource = Timelines.tag("mastodonkit")

        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 0)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
