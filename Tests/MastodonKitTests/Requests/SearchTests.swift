//
//  SearchTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class TimelinesTeSearchTestssts: XCTestCase {
    func testSearchWithoutResolve() {
        let request = Search.search(query: "mastodonkit")
        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/search")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 1)
        XCTAssertTrue(request.method.queryItems!.contains(expectedQuery))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Results>.self)
    }

    func testSearchWithResolve() {
        let request = Search.search(query: "mastodonkit", resolve: true)
        let expectedQuery = URLQueryItem(name: "q", value: "mastodonkit")
        let expectedResolve = URLQueryItem(name: "resolve", value: "true")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/search")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(request.method.queryItems!.contains(expectedResolve))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Results>.self)
    }
}
