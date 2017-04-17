import XCTest
@testable import MastodonKit

class StatusTests: XCTestCase {
    static var allTests = [
        ("testStatusWithNullFromJSON", testStatusWithNullFromJSON),
        ("testStatusWithoutNullFromJSON", testStatusWithoutNullFromJSON)
    ]

    func testStatusWithNullFromJSON() {
        let statusFixture = try? Fixture.load(fileName: "Fixtures/StatusWithNull.json")
        let dictionary = statusFixture as! JSONDictionary
        let status = Status(json: dictionary)

        XCTAssertEqual(status?.id, 1)
        XCTAssertEqual(status?.uri, "tag_uri")
        XCTAssertEqual(status?.url, URL(string: "https://mastodon.technology/@ornithocoder"))
        XCTAssertNotNil(status?.account)
        XCTAssertNil(status?.inReplyToID)
        XCTAssertNil(status?.inReplyToAccountID)
        XCTAssertEqual(status?.content, "This is a very very long status message posted on Mastodon. OK, not that long because I'm lazy and don't want to type a long fixture.")
        XCTAssertEqual(status?.reblogsCount, 0)
        XCTAssertEqual(status?.favouritesCount, 1)
        XCTAssertNil(status?.reblogged)
        XCTAssertTrue((status?.favourited)!)
        XCTAssertNil(status?.sensitive)
        XCTAssertEqual(status?.spoilerText, "Let's keep his a secret!")
        XCTAssertEqual(status?.visibility, VisibilityType.public)
        XCTAssertEqual(status?.mediaAttachments.count, 0)
        XCTAssertEqual(status?.mentions.count, 0)
        XCTAssertEqual(status?.tags.count, 0)
        XCTAssertNotNil(status?.application)
    }

    func testStatusWithoutNullFromJSON() {
        let statusFixture = try? Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let dictionary = statusFixture as! JSONDictionary
        let status = Status(json: dictionary)

        XCTAssertEqual(status?.id, 1)
        XCTAssertEqual(status?.uri, "tag_uri")
        XCTAssertEqual(status?.url, URL(string: "https://mastodon.technology/@ornithocoder"))
        XCTAssertNotNil(status?.account)
        XCTAssertEqual(status?.inReplyToID, 32)
        XCTAssertEqual(status?.inReplyToAccountID, 22)
        XCTAssertEqual(status?.content, "This is a very very long status message posted on Mastodon. OK, not that long because I'm lazy and don't want to type a long fixture.")
        XCTAssertEqual(status?.reblogsCount, 0)
        XCTAssertEqual(status?.favouritesCount, 1)
        XCTAssertTrue((status?.reblogged)!)
        XCTAssertTrue((status?.favourited)!)
        XCTAssertTrue((status?.sensitive)!)
        XCTAssertEqual(status?.spoilerText, "Let's keep his a secret!")
        XCTAssertEqual(status?.visibility, VisibilityType.public)
        XCTAssertEqual(status?.mediaAttachments.count, 0)
        XCTAssertEqual(status?.mentions.count, 0)
        XCTAssertEqual(status?.tags.count, 0)
        XCTAssertNotNil(status?.application)
    }
}
