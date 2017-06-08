//
//  HTTPURLResponse.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/1/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class HTTPURLResponseTests: XCTestCase {
    func testPaginationWithValidLink() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=123>; rel=\"prev\"",
            "<https://mastodon.technology/api/v1/timelines/home?limit=52&max_id=321>; rel=\"next\""
            ].joined(separator: ",")

        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: ["Link": links]
        )

        XCTAssertEqual(response?.pagination?.next, .max(id: 321, limit: 52))
        XCTAssertEqual(response?.pagination?.previous, .since(id: 123, limit: 42))
    }

    func testPaginationWithInvalidLink() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=123>; rel=\"\"",
            "<https://mastodon.technology/api/v1/timelines/home>; rel=\"next\""
            ].joined(separator: ",")

        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: ["Link": links]
        )

        XCTAssertNil(response?.pagination?.next)
        XCTAssertNil(response?.pagination?.previous)
    }

    func testPaginationWithoutLink() {
        let response = HTTPURLResponse(
            url: URL(string: "https://my.mastodon.instance/api/v1/timelines/home")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        XCTAssertNil(response?.pagination)
    }
}
