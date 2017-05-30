//
//  AccessScopeTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class AccessScopeTests: XCTestCase {
    func testRead() {
        let type = AccessScope(string: "read")

        XCTAssertEqual(type, AccessScope.read)
        XCTAssertEqual(type.rawValue, "read")
    }

    func testWrite() {
        let type = AccessScope(string: "write")

        XCTAssertEqual(type, AccessScope.write)
        XCTAssertEqual(type.rawValue, "write")
    }

    func testFollow() {
        let type = AccessScope(string: "follow")

        XCTAssertEqual(type, AccessScope.follow)
        XCTAssertEqual(type.rawValue, "follow")
    }

    func testInvalidType() {
        let type = AccessScope(string: "foobar")

        XCTAssertEqual(type, AccessScope.read)
        XCTAssertEqual(type.rawValue, "read")
    }
}
