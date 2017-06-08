//
//  TimelinesTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class TimelinesTests: XCTestCase {
    func testHomeTimeline() {
        let request = Timelines.home()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/home")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testHomeTimelineWithRange() {
        let request = Timelines.home(range: .limit(32))
        let expectedLimit = URLQueryItem(name: "limit", value: "32")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/home")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 1)
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testPublicTimelineLocal() {
        let request = Timelines.public(local: true)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertTrue(request.method.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testPublicTimelineFederated() {
        let request = Timelines.public()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 0)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testPublicTimelineLocalWithRange() {
        let request = Timelines.public(local: true, range: .since(id: 420, limit: 12))
        let expectedLocal = URLQueryItem(name: "local", value: "true")
        let expectedLimit = URLQueryItem(name: "limit", value: "12")
        let expectedSinceID = URLQueryItem(name: "since_id", value: "420")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/public")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems!.count, 3)
        XCTAssertTrue(request.method.queryItems!.contains(expectedLocal))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testTagTimelineLocal() {
        let request = Timelines.tag("mastodonkit", local: true)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertTrue(request.method.queryItems!.contains(URLQueryItem(name: "local", value: "true")))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testTagTimelineFederated() {
        let request = Timelines.tag("mastodonkit")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 0)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testTagTimelineWithRange() {
        let request = Timelines.tag("mastodonkit", range: .since(id: 420, limit: 12))
        let expectedLimit = URLQueryItem(name: "limit", value: "12")
        let expectedSinceID = URLQueryItem(name: "since_id", value: "420")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/timelines/tag/mastodonkit")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems!.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }
}
