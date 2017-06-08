//
//  PaginationItemTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/1/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class PaginationItemTests: XCTestCase {
    func testValidMaxIDAndLimit() {
        let link = PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?limit=42&max_id=420>; rel=\"next\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .next)
        XCTAssertEqual(link?.id, 420)
        XCTAssertEqual(link?.limit, 42)
    }

    func testValidMaxIDAndNoLimit() {
        let link = PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"next\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .next)
        XCTAssertEqual(link?.id, 420)
        XCTAssertNil(link?.limit)
    }

    func testValidMaxIDAndLimitAndWhiteSpaces() {
        let link = PaginationItem(webLink: " < https://mastodon.technology/api/v1/timelines/home?limit=42&max_id=420 > ; rel = \" next \" ")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .next)
        XCTAssertEqual(link?.id, 420)
        XCTAssertEqual(link?.limit, 42)
    }

    func testValidSinceIDAndLimit() {
        let link = PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=420>; rel=\"prev\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .prev)
        XCTAssertEqual(link?.id, 420)
        XCTAssertEqual(link?.limit, 42)
    }

    func testValidSinceIDAndNoLimit() {
        let link = PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?since_id=420>; rel=\"prev\"")

        XCTAssertNotNil(link)

        XCTAssertEqual(link?.type, .prev)
        XCTAssertEqual(link?.id, 420)
        XCTAssertNil(link?.limit)
    }

    func testInvalidRelationship() {
        XCTAssertNil(PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"covfefe\""))
        XCTAssertNil(PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"\""))
    }

    func testInvalidURL() {
        XCTAssertNil(PaginationItem(webLink: "this is not a valid URL; rel=\"next\""))
        XCTAssertNil(PaginationItem(webLink: "; rel=\"next\""))
        XCTAssertNil(PaginationItem(webLink: "rel=\"next\""))
    }

    func testMissingSinceIDAndMaxID() {
        XCTAssertNil(PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home>; rel=\"next\""))
        XCTAssertNil(PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?limit=42>; rel=\"next\""))
    }

    func testMissingRelationship() {
        XCTAssertNil(PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>;"))
        XCTAssertNil(PaginationItem(webLink: "<https://mastodon.technology/api/v1/timelines/home?max_id=420>"))
    }
}
