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
        XCTAssertEqual(AccessScope(rawValue: "read"), AccessScope.read)
    }

    func testWrite() {
        XCTAssertEqual(AccessScope(rawValue: "write"), AccessScope.write)
    }

    func testFollow() {
        XCTAssertEqual(AccessScope(rawValue: "follow"), AccessScope.follow)
    }

    func testInvalidType() {
        XCTAssertNil(AccessScope(rawValue: "foobar"))
    }
}
