//
//  MutesTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class MutesTests: XCTestCase {
    func testAll() {
        let request = Mutes.all()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/mutes")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testAllWithRange() {
        let request = Mutes.all(range: .since(id: 15, limit: 37))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "15")
        let expectedLimit = URLQueryItem(name: "limit", value: "37")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/mutes")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }
}
