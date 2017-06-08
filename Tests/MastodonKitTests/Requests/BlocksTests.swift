//
//  BlocksTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class BlocksTests: XCTestCase {
    func testAll() {
        let request = Blocks.all()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/blocks")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testAllWithRange() {
        let request = Blocks.all(range: .max(id: 42, limit: nil))
        let expectedMaxID = URLQueryItem(name: "max_id", value: "42")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/blocks")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 1)
        XCTAssertTrue(request.method.queryItems!.contains(expectedMaxID))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }
}
