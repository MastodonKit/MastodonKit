//
//  EmojiTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 1/1/18.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class EmojiTests: XCTestCase {
    func testEmojiFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Emoji.json")
        let emoji = try? Emoji.decode(data: fixture)

        XCTAssertEqual(emoji?.shortcode, "mastodon")
        XCTAssertEqual(emoji?.staticURL, URL(string: "https://static.mastodon.technology/custom_emojis/images/000/000/435/static/61371621aea40c9e.png")!)
        XCTAssertEqual(emoji?.url, URL(string: "https://static.mastodon.technology/custom_emojis/images/000/000/435/original/61371621aea40c9e.png")!)
    }
}
