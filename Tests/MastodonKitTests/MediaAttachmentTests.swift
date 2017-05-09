import XCTest
@testable import MastodonKit

class MediaAttachmentTests: XCTestCase {
    func testJPEG() {
        let imageData = Data()
        let media = MediaAttachment.jpeg(imageData)

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.jpg")
        XCTAssertEqual(media.mimeType, "image/jpg")
    }

    func testGIF() {
        let imageData = Data()
        let media = MediaAttachment.gif(imageData)

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.gif")
        XCTAssertEqual(media.mimeType, "image/gif")
    }

    func testPNG() {
        let imageData = Data()
        let media = MediaAttachment.png(imageData)

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.png")
        XCTAssertEqual(media.mimeType, "image/png")
    }

    func testOtherMedia() {
        let imageData = Data()
        let media = MediaAttachment.other(imageData, fileExtension: "mp4", mimeType: "video/mp4")

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.mp4")
        XCTAssertEqual(media.mimeType, "video/mp4")
    }
}
