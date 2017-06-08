//
//  AttachmentTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class AttachmentTests: XCTestCase {
    func testAttachmentFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Attachment.json")
        let dictionary = fixture as! JSONDictionary
        let attachment = Attachment(from: dictionary)

        XCTAssertEqual(attachment?.id, 42)
        XCTAssertEqual(attachment?.type, AttachmentType.image)
        XCTAssertEqual(attachment?.url, "http://lorempixel.com/200/200/cats/3/")
        XCTAssertEqual(attachment?.previewURL, "http://lorempixel.com/200/200/cats/4/")
        XCTAssertEqual(attachment?.textURL, "https://mastodon.technology/@ornithocoder")
    }

    func testAttachmentWithInvalidData() {
        let attachment = Attachment(from: [:])

        XCTAssertNil(attachment)
    }
}
