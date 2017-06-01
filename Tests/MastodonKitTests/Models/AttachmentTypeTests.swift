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
        XCTAssertEqual(AttachmentType(rawValue: "image"), AttachmentType.image)
    }

    func testVideo() {
        XCTAssertEqual(AttachmentType(rawValue: "video"), AttachmentType.video)
    }

    func testGif() {
        XCTAssertEqual(AttachmentType(rawValue: "gifv"), AttachmentType.gifv)
    }

    func testInvalidType() {
        XCTAssertNil(AttachmentType(rawValue: "foobar"))
    }
}
