//
//  FollowRequestsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class FollowRequestsTests: XCTestCase {
    func testAll() {
        let request = FollowRequests.all()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/follow_requests")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testAllWithRange() {
        let request = FollowRequests.all(range: .max(id: 12, limit: 50))
        let expectedMaxID = URLQueryItem(name: "max_id", value: "12")
        let expectedLimit = URLQueryItem(name: "limit", value: "50")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/follow_requests")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedMaxID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testAuthorize() {
        let request = FollowRequests.authorize(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/follow_requests/42/authorize")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Empty>.self)
    }

    func testReject() {
        let request = FollowRequests.reject(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/follow_requests/42/reject")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Empty>.self)
    }
}
