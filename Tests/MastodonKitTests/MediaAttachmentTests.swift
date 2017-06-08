//
//  MediaAttachmentTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class MediaAttachmentTests: XCTestCase {
    func testJPEG() {
        let imageData = Data(count: 8)
        let media = MediaAttachment.jpeg(imageData)

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.jpg")
        XCTAssertEqual(media.mimeType, "image/jpg")
        XCTAssertEqual(media.base64EncondedString, "data:image/jpg;base64,AAAAAAAAAAA=")
    }

    func testGIF() {
        let imageData = Data(count: 8)
        let media = MediaAttachment.gif(imageData)

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.gif")
        XCTAssertEqual(media.mimeType, "image/gif")
        XCTAssertEqual(media.base64EncondedString, "data:image/gif;base64,AAAAAAAAAAA=")
    }

    func testPNG() {
        let imageData = Data(count: 8)
        let media = MediaAttachment.png(imageData)

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.png")
        XCTAssertEqual(media.mimeType, "image/png")
        XCTAssertEqual(media.base64EncondedString, "data:image/png;base64,AAAAAAAAAAA=")
    }

    func testOtherMedia() {
        let imageData = Data(count: 8)
        let media = MediaAttachment.other(imageData, fileExtension: "mp4", mimeType: "video/mp4")

        XCTAssertEqual(media.data, imageData)
        XCTAssertEqual(media.fileName, "file.mp4")
        XCTAssertEqual(media.mimeType, "video/mp4")
        XCTAssertEqual(media.base64EncondedString, "data:video/mp4;base64,AAAAAAAAAAA=")
    }
}
