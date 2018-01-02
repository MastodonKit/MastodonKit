//
//  RequestParsersTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class StringsTests: XCTestCase {
    func testDomainBlocksFromValidJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/DomainBlocks.json")
        let parsed = try? [String].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 3)

        XCTAssertTrue(parsed!.contains("toto"))
        XCTAssertTrue(parsed!.contains("foo"))
        XCTAssertTrue(parsed!.contains("bar"))
    }

    func testDomainBlocksWithInvalidData() {
        let parsed = try? [String].decode(data: Data())

        XCTAssertNil(parsed)
    }
}
