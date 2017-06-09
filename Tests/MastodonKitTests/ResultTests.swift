//
//  ResultTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ResultTests: XCTestCase {
    func testSuccessWithoutPagination() {
        let result = Result.success("foo", nil)

        XCTAssertEqual(result.value, "foo")
        XCTAssertNil(result.pagination)
        XCTAssertNil(result.error)
        XCTAssertFalse(result.isError)
    }

    func testSuccessWithPagination() {
        let pagination = Pagination(next: .default, previous: .limit(42))
        let result = Result.success("foo", pagination)

        XCTAssertEqual(result.value, "foo")
        XCTAssertEqual(result.pagination, pagination)
        XCTAssertNil(result.error)
        XCTAssertFalse(result.isError)
    }

    func testError() {
        let result = Result<Any>.failure(ClientError.malformedURL)

        XCTAssertNil(result.value)
        XCTAssertNil(result.pagination)
        XCTAssertNotNil(result.error)
        XCTAssertTrue(result.isError)
    }
}
