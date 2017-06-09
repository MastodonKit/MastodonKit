//
//  PaginationTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/1/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class PaginationTests: XCTestCase {
    func testPaginationWithInvalidNextAndPrevious() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"\"",
            "this is not a valid URL; rel=\"next\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNil(pagination.next)
        XCTAssertNil(pagination.previous)
    }

    func testPaginationWithValidNext() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&max_id=420>; rel=\"next\"",
            "this is not a valid URL; rel=\"prev\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNotNil(pagination.next)
        XCTAssertNil(pagination.previous)

        XCTAssertEqual(pagination.next, .max(id: 420, limit: 42))
    }

    func testPaginationWithValidPrevious() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=420>; rel=\"prev\"",
            "this is not a valid URL; rel=\"next\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNil(pagination.next)
        XCTAssertNotNil(pagination.previous)

        XCTAssertEqual(pagination.previous, .since(id: 420, limit: 42))
    }

    func testPaginationWithValidNextAndPrevious() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=123>; rel=\"prev\"",
            "<https://mastodon.technology/api/v1/timelines/home?limit=52&max_id=321>; rel=\"next\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNotNil(pagination.next)
        XCTAssertNotNil(pagination.previous)

        XCTAssertEqual(pagination.next, .max(id: 321, limit: 52))
        XCTAssertEqual(pagination.previous, .since(id: 123, limit: 42))
    }

    func testEqualityWithMatchingNilRanges() {
        let firstPagination = Pagination(next: nil, previous: nil)
        let secondPagination = Pagination(next: nil, previous: nil)

        XCTAssertEqual(firstPagination, secondPagination)
    }

    func testEqualityWithMatchingNextAndMatchingNilPrevious() {
        let firstPagination = Pagination(next: .default, previous: nil)
        let secondPagination = Pagination(next: .default, previous: nil)

        XCTAssertEqual(firstPagination, secondPagination)
    }

    func testEqualityWithMatchingNilNextAndMatchingPrevious() {
        let firstPagination = Pagination(next: nil, previous: .default)
        let secondPagination = Pagination(next: nil, previous: .default)

        XCTAssertEqual(firstPagination, secondPagination)
    }

    func testEqualityWithMatchingNextAndPrevious() {
        let firstPagination = Pagination(next: .limit(42), previous: .default)
        let secondPagination = Pagination(next: .limit(42), previous: .default)

        XCTAssertEqual(firstPagination, secondPagination)
    }

    func testEqualityWithMismatchingNextAndMatchingNilPrevious() {
        let firstPagination = Pagination(next: .limit(42), previous: nil)
        let secondPagination = Pagination(next: .default, previous: nil)

        XCTAssertNotEqual(firstPagination, secondPagination)
    }

    func testEqualityWithMatchingNilNextAndMismatchingPrevious() {
        let firstPagination = Pagination(next: nil, previous: .default)
        let secondPagination = Pagination(next: nil, previous: .limit(42))

        XCTAssertNotEqual(firstPagination, secondPagination)
    }

    func testEqualityWithMismatchingNextAndPrevious() {
        let firstPagination = Pagination(next: .limit(42), previous: .default)
        let secondPagination = Pagination(next: .default, previous: .limit(42))

        XCTAssertNotEqual(firstPagination, secondPagination)
    }
}
