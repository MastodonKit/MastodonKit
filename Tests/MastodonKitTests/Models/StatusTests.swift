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
        let fixture = try! Fixture.load(fileName: "Fixtures/StatusWithNull.json")
        let status = try? Status.decode(data: fixture)

        XCTAssertEqual(status?.id, "1")
        XCTAssertEqual(status?.uri, "tag_uri")
        XCTAssertEqual(status?.url, URL(string: "https://mastodon.technology/@ornithocoder"))
        XCTAssertNotNil(status?.account)
        XCTAssertNil(status?.inReplyToID)
        XCTAssertNil(status?.inReplyToAccountID)
        XCTAssertNil(status?.reblog)
        XCTAssertEqual(status?.content, "This is a very very long status message posted on Mastodon. OK, not that long because I'm lazy and don't want to type a long fixture.")
        XCTAssertEqual(status?.createdAt.timeIntervalSince1970, 1491497702.132)
        XCTAssertEqual(status?.emojis.count, 0)
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
        XCTAssertNil(status?.pinned)
    }

    func testStatusWithoutNullFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let status = try? Status.decode(data: fixture)

        XCTAssertEqual(status?.id, "1")
        XCTAssertEqual(status?.uri, "tag_uri")
        XCTAssertEqual(status?.url, URL(string: "https://mastodon.technology/@ornithocoder"))
        XCTAssertNotNil(status?.account)
        XCTAssertEqual(status?.inReplyToID, "32")
        XCTAssertEqual(status?.inReplyToAccountID, "22")
        XCTAssertNotNil(status?.reblog)
        XCTAssertEqual(status?.content, "This is a very very long status message posted on Mastodon. OK, not that long because I'm lazy and don't want to type a long fixture.")
        XCTAssertEqual(status?.createdAt.timeIntervalSince1970, 1491497702.132)
        XCTAssertEqual(status?.emojis.count, 1)
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
        XCTAssertTrue((status?.pinned)!)
    }

    func testStatusWithInvalidData() {
        let parsed = try? Status.decode(data: Data())

        XCTAssertNil(parsed)
    }

    func testStatusesFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let parsed = try? [Status].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testStatusesWithInvalidData() {
        let parsed = try? [Status].decode(data: Data())

        XCTAssertNil(parsed)
    }
}
