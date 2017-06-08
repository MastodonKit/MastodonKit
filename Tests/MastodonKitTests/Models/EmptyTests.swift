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
        let fixture = try? Fixture.load(fileName: "Fixtures/Empty.json")
        let dictionary = fixture as! JSONDictionary
        let empty = Empty(from: dictionary)

        XCTAssertNotNil(empty)
    }
}
