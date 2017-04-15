import XCTest
@testable import MastodonKit

class TagTests: XCTestCase {
    static var allTests = [
        ("testTagsFromJSON", testTagsFromJSON)
    ]

    var tagsFixture: Any!

    override func setUp() {
        super.setUp()
        tagsFixture = try? Fixture.load(fileName: "Fixtures/Tag.json")
    }

    func testTagsFromJSON() {
        let dictionary = tagsFixture as! JSONDictionary
        let tag = Tag(json: dictionary)

        XCTAssertEqual(tag?.name, "mastodon")
        XCTAssertEqual(tag?.url, "https://mastodon.technology/web/timelines/tag/mastodonkit")
    }
}
