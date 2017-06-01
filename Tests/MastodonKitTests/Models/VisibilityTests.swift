//
//  VisibilityTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class VisibilityTests: XCTestCase {
    func testPublic() {
        XCTAssertEqual(Visibility(rawValue: "public"), Visibility.public)
    }

    func testUnlisted() {
        XCTAssertEqual(Visibility(rawValue: "unlisted"), Visibility.unlisted)
    }

    func testPrivate() {
        XCTAssertEqual(Visibility(rawValue: "private"), Visibility.private)
    }

    func testDirect() {
        XCTAssertEqual(Visibility(rawValue: "direct"), Visibility.direct)
    }

    func testInvalidType() {
        XCTAssertNil(Visibility(rawValue: "foobar"))
    }
}
