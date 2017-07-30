//
//  AttachmentTypeTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
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

    func testUnknown() {
        XCTAssertEqual(AttachmentType(rawValue: "unknown"), AttachmentType.unknown)
    }

    func testInvalidType() {
        XCTAssertNil(AttachmentType(rawValue: "foobar"))
    }
}
