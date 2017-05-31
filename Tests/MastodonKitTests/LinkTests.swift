//
//  LinkTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/31/17.
//  Copyright © 2017 MastodonKit. All rights reserved.

import XCTest
@testable import MastodonKit

class LinkTests: XCTestCase {
    func testValidMaxIDAndLimit() {
        let link = Link(string: "<https://mastodon.technology/api/v1/timelines/home?limit=42&max_id=420>; rel=\"next\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .next)
        XCTAssertEqual(link?.id, 420)
        XCTAssertEqual(link?.limit, 42)
    }

    func testValidMaxIDAndNoLimit() {
        let link = Link(string: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"next\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .next)
        XCTAssertEqual(link?.id, 420)
        XCTAssertNil(link?.limit)
    }

    func testValidMaxIDAndLimitAndWhiteSpaces() {
        let link = Link(string: " < https://mastodon.technology/api/v1/timelines/home?limit=42&max_id=420 > ; rel = \" next \" ")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .next)
        XCTAssertEqual(link?.id, 420)
        XCTAssertEqual(link?.limit, 42)
    }

    func testValidSinceIDAndLimit() {
        let link = Link(string: "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=420>; rel=\"prev\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .prev)
        XCTAssertEqual(link?.id, 420)
        XCTAssertEqual(link?.limit, 42)
    }

    func testValidSinceIDAndNoLimit() {
        let link = Link(string: "<https://mastodon.technology/api/v1/timelines/home?since_id=420>; rel=\"prev\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .prev)
        XCTAssertEqual(link?.id, 420)
        XCTAssertNil(link?.limit)
    }

    func testInvalidRelationship() {
        XCTAssertNil(Link(string: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"covfefe\""))
        XCTAssertNil(Link(string: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"\""))
    }

    func testInvalidURL() {
        XCTAssertNil(Link(string: "this is not a valid URL; rel=\"next\""))
        XCTAssertNil(Link(string: "; rel=\"next\""))
        XCTAssertNil(Link(string: "rel=\"next\""))
    }

    func testMissingSinceIDAndMaxID() {
        XCTAssertNil(Link(string: "<https://mastodon.technology/api/v1/timelines/home>; rel=\"next\""))
        XCTAssertNil(Link(string: "<https://mastodon.technology/api/v1/timelines/home?limit=42>; rel=\"next\""))
    }

    func testMissingRelationship() {
        XCTAssertNil(Link(string: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>;"))
        XCTAssertNil(Link(string: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>"))
    }
}
