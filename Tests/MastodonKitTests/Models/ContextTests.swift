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
        let fixture = try? Fixture.load(fileName: "Fixtures/Context.json")
        let dictionary = fixture as! JSONDictionary
        let context = Context(from: dictionary)

        XCTAssertEqual(context?.ancestors.count, 1)
        XCTAssertEqual(context?.descendants.count, 1)
    }
}
