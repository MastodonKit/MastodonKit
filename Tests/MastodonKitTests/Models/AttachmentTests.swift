import XCTest
@testable import MastodonKit

class AttachmentTests: XCTestCase {
    static var allTests = [
        ("testAttachmentFromJSON", testAttachmentFromJSON)
    ]

    func testAttachmentFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Attachment.json")
        let dictionary = fixture as! JSONDictionary
        let attachment = Attachment(json: dictionary)

        XCTAssertEqual(attachment?.id, 42)
        XCTAssertEqual(attachment?.type, AttachmentType.image)
        XCTAssertEqual(attachment?.url, "http://lorempixel.com/200/200/cats/3/")
        XCTAssertEqual(attachment?.previewURL, "http://lorempixel.com/200/200/cats/4/")
        XCTAssertEqual(attachment?.textURL, "https://mastodon.technology/@ornithocoder")
    }
}
