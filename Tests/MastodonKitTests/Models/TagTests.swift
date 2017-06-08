//
//  TagTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class TagTests: XCTestCase {
    func testTagFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Tag.json")
        let dictionary = fixture as! JSONDictionary
        let tag = Tag(from: dictionary)

        XCTAssertEqual(tag?.name, "mastodon")
        XCTAssertEqual(tag?.url, "https://mastodon.technology/web/timelines/tag/mastodonkit")
    }

    func testTagWithInvalidData() {
        let tag = Tag(from: [:])

        XCTAssertNil(tag)
    }
}
