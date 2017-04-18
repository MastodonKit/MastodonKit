import XCTest
@testable import MastodonKit

class MentionTests: XCTestCase {
    func testMentionFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Mention.json")
        let dictionary = fixture as! JSONDictionary
        let mention = Mention(json: dictionary)

        XCTAssertEqual(mention?.id, 42)
        XCTAssertEqual(mention?.username, "ornithocoder")
        XCTAssertEqual(mention?.acct,"ornithocoder")
        XCTAssertEqual(mention?.url, "https://mastodon.technology/@ornithocoder")
    }
}
