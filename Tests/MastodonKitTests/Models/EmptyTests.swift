//
//  EmptyTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/8/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class EmptyTests: XCTestCase {
    func testEmptyFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Empty.json")
        let empty = try? Empty.decode(data: fixture)

        XCTAssertNotNil(empty)
    }

    func testEmptyWithEmptyDictionary() {
        let fixture = "[:]".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }

    func testEmptyWithNonEmptyDictionary() {
        let fixture = "[\"foo\": \"bar\"]".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }

    func testEmptyWithEmptyString() {
        let fixture = "".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }

    func testEmptyWithString() {
        let fixture = "foo".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }
}
