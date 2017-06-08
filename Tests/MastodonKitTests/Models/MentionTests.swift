//
//  MentionTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class MentionTests: XCTestCase {
    func testMentionFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Mention.json")
        let dictionary = fixture as! JSONDictionary
        let mention = Mention(from: dictionary)

        XCTAssertEqual(mention?.id, 42)
        XCTAssertEqual(mention?.username, "ornithocoder")
        XCTAssertEqual(mention?.acct, "ornithocoder")
        XCTAssertEqual(mention?.url, "https://mastodon.technology/@ornithocoder")
    }

    func testMentionWithInvalidData() {
        let mention = Mention(from: [:])

        XCTAssertNil(mention)
    }
}
