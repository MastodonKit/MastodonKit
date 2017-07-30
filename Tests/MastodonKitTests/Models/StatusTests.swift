//
//  StatusTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class StatusTests: XCTestCase {
    func testStatusWithNullFromJSON() {
        let statusFixture = try? Fixture.load(fileName: "Fixtures/StatusWithNull.json")
        let dictionary = statusFixture as! JSONDictionary
        let status = Status(from: dictionary)

        XCTAssertEqual(status?.id, 1)
        XCTAssertEqual(status?.uri, "tag_uri")
        XCTAssertEqual(status?.url, URL(string: "https://mastodon.technology/@ornithocoder"))
        XCTAssertNotNil(status?.account)
        XCTAssertNil(status?.inReplyToID)
        XCTAssertNil(status?.inReplyToAccountID)
        XCTAssertNil(status?.reblog)
        XCTAssertEqual(status?.content, "This is a very very long status message posted on Mastodon. OK, not that long because I'm lazy and don't want to type a long fixture.")
        XCTAssertEqual(status?.createdAt.timeIntervalSince1970, 1491497702.132)
        XCTAssertEqual(status?.reblogsCount, 0)
        XCTAssertEqual(status?.favouritesCount, 1)
        XCTAssertNil(status?.reblogged)
        XCTAssertTrue((status?.favourited)!)
        XCTAssertNil(status?.sensitive)
        XCTAssertEqual(status?.spoilerText, "Let's keep his a secret!")
        XCTAssertEqual(status?.visibility, Visibility.public)
        XCTAssertEqual(status?.mediaAttachments.count, 0)
        XCTAssertEqual(status?.mentions.count, 0)
        XCTAssertEqual(status?.tags.count, 0)
        XCTAssertNotNil(status?.application)
        XCTAssertNil(status?.language)
    }

    func testStatusWithoutNullFromJSON() {
        let statusFixture = try? Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let dictionary = statusFixture as! JSONDictionary
        let status = Status(from: dictionary)

        XCTAssertEqual(status?.id, 1)
        XCTAssertEqual(status?.uri, "tag_uri")
        XCTAssertEqual(status?.url, URL(string: "https://mastodon.technology/@ornithocoder"))
        XCTAssertNotNil(status?.account)
        XCTAssertEqual(status?.inReplyToID, 32)
        XCTAssertEqual(status?.inReplyToAccountID, 22)
        XCTAssertNotNil(status?.reblog)
        XCTAssertEqual(status?.content, "This is a very very long status message posted on Mastodon. OK, not that long because I'm lazy and don't want to type a long fixture.")
        XCTAssertEqual(status?.createdAt.timeIntervalSince1970, 1491497702.132)
        XCTAssertEqual(status?.reblogsCount, 0)
        XCTAssertEqual(status?.favouritesCount, 1)
        XCTAssertTrue((status?.reblogged)!)
        XCTAssertTrue((status?.favourited)!)
        XCTAssertTrue((status?.sensitive)!)
        XCTAssertEqual(status?.spoilerText, "Let's keep his a secret!")
        XCTAssertEqual(status?.visibility, Visibility.public)
        XCTAssertEqual(status?.mediaAttachments.count, 0)
        XCTAssertEqual(status?.mentions.count, 0)
        XCTAssertEqual(status?.tags.count, 0)
        XCTAssertNotNil(status?.application)
        XCTAssertEqual(status?.language, "fr")
    }
}
