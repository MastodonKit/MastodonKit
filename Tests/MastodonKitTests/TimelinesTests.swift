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
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testPublicTimeline() {
        let resource = Timelines.public()

        XCTAssertEqual(resource.path, "/api/v1/timelines/public")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testTagTimeline() {
        let resource = Timelines.tag(hashtag: "mastodonkit")

        XCTAssertEqual(resource.path, "/api/v1/timelines/tag/mastodonkit")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }
}
