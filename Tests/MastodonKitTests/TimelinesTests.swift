import XCTest
@testable import MastodonKit

class TimelinesTests: XCTestCase {
    static var allTests = [
        ("testHomeTimeline", testHomeTimeline),
        ("testPublicTimeline", testPublicTimeline),
        ("testTagTimeline", testTagTimeline)
    ]

    func testHomeTimeline() {
        let resource = Timelines.home()

        XCTAssertEqual(resource.path, "/api/v1/timelines/home")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testPublicTimeline() {
        let resource = Timelines.public()

        XCTAssertEqual(resource.path, "/api/v1/timelines/public")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testTagTimeline() {
        let resource = Timelines.tag("mastodonkit")

        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }
}
