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
        let type = Visibility(string: "public")

        XCTAssertEqual(type, Visibility.public)
        XCTAssertEqual(type.rawValue, "public")
    }

    func testUnlisted() {
        let type = Visibility(string: "unlisted")

        XCTAssertEqual(type, Visibility.unlisted)
        XCTAssertEqual(type.rawValue, "unlisted")
    }

    func testPrivate() {
        let type = Visibility(string: "private")

        XCTAssertEqual(type, Visibility.private)
        XCTAssertEqual(type.rawValue, "private")
    }

    func testDirect() {
        let type = Visibility(string: "direct")

        XCTAssertEqual(type, Visibility.direct)
        XCTAssertEqual(type.rawValue, "direct")
    }

    func testInvalidType() {
        let type = Visibility(string: "foobar")

        XCTAssertEqual(type, Visibility.unlisted)
        XCTAssertEqual(type.rawValue, "unlisted")
    }
}
