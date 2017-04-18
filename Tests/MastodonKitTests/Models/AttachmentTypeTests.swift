import XCTest
@testable import MastodonKit

class AttachmentTypeTests: XCTestCase {
    func testImage() {
        XCTAssertEqual(AttachmentType(string: "image"), AttachmentType.image)
    }

    func testVideo() {
        XCTAssertEqual(AttachmentType(string: "video"), AttachmentType.video)
    }

    func testGif() {
        XCTAssertEqual(AttachmentType(string: "gifv"), AttachmentType.gifv)
    }

    func testUnknown() {
        XCTAssertEqual(AttachmentType(string: "foobar"), AttachmentType.unknown)
    }
}
