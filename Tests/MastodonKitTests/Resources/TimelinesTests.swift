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

    func testPublicTimeline() {
        let resource = Timelines.public()

        XCTAssertEqual(resource.path, "/api/v1/timelines/public")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testTagTimeline() {
        let resource = Timelines.tag("mastodonkit")

        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }
}
