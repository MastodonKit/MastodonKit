import XCTest
@testable import MastodonKit

class TagTests: XCTestCase {
    static var allTests = [
        ("testTagsFromJSON", testTagsFromJSON)
    ]

    func testTagsFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Tag.json")
        let dictionary = fixture as! JSONDictionary
        let tag = Tag(json: dictionary)

        XCTAssertEqual(tag?.name, "mastodon")
        XCTAssertEqual(tag?.url, "https://mastodon.technology/web/timelines/tag/mastodonkit")
    }
}
