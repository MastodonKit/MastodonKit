//
//  ContextTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ContextTests: XCTestCase {
    func testContextFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Context.json")
        let context = try? Context.decode(data: fixture)

        XCTAssertEqual(context?.ancestors.count, 1)
        XCTAssertEqual(context?.descendants.count, 1)
    }

    func testContextWithInvalidData() {
        let parsed = try? Context.decode(data: Data())

        XCTAssertNil(parsed)
    }
}
