//
//  DataTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class DataTests: XCTestCase {
    func testJPEG() {
        let imageData = Data()
        let data = Data(mediaAttachment: .jpeg(imageData))

        XCTAssertEqual(
            String(data: data!, encoding: .utf8),
            "--MastodonKitBoundary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"file.jpg\"\r\nContent-Type: image/jpg\r\n\r\n\r\n--MastodonKitBoundary--\r\n"
        )
    }

    func testGIF() {
        let imageData = Data()
        let data = Data(mediaAttachment: .gif(imageData))

        XCTAssertEqual(
            String(data: data!, encoding: .utf8),
            "--MastodonKitBoundary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"file.gif\"\r\nContent-Type: image/gif\r\n\r\n\r\n--MastodonKitBoundary--\r\n"
        )
    }

    func testPNG() {
        let imageData = Data()
        let data = Data(mediaAttachment: .png(imageData))

        XCTAssertEqual(
            String(data: data!, encoding: .utf8),
            "--MastodonKitBoundary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"file.png\"\r\nContent-Type: image/png\r\n\r\n\r\n--MastodonKitBoundary--\r\n"
        )
    }

    func testOtherMedia() {
        let imageData = Data()
        let media = MediaAttachment.other(imageData, fileExtension: "mp4", mimeType: "video/mp4")
        let data = Data(mediaAttachment: media)

        XCTAssertEqual(
            String(data: data!, encoding: .utf8),
            "--MastodonKitBoundary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"file.mp4\"\r\nContent-Type: video/mp4\r\n\r\n\r\n--MastodonKitBoundary--\r\n"
        )
    }

    func testWithInvalidImageData() {
        let data = Data(mediaAttachment: .png(nil))

        XCTAssertNil(data)
    }

    func testAppendWithValidString() {
        let string = "Foo"

        var data = Data()
        data.append(string)

        XCTAssertEqual(String(data: data, encoding: .utf8), "Foo")
    }

    func testAppendWithNilString() {
        let string: String? = nil

        var data = Data()
        data.append(string)

        XCTAssertEqual(data.count, 0)
    }
}
