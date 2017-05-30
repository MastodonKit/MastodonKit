//
//  AttachmentTypeTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

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
