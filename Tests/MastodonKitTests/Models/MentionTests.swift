import XCTest
@testable import MastodonKit

class MentionTests: XCTestCase {
    static var allTests = [
        ("testMentionFromJSON", testMentionFromJSON)
    ]

    var mentionFixture: Any!

    override func setUp() {
        super.setUp()
        mentionFixture = try? Fixture.load(fileName: "Fixtures/Mention.json")
    }

    func testMentionFromJSON() {
        let dictionary = mentionFixture as! JSONDictionary
        let mention = Mention(json: dictionary)

        XCTAssertEqual(mention?.id, 42)
        XCTAssertEqual(mention?.username, "ornithocoder")
        XCTAssertEqual(mention?.acct,"ornithocoder")
        XCTAssertEqual(mention?.url, "https://mastodon.technology/@ornithocoder")
    }
}
