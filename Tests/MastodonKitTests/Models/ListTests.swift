//
//  ListTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 1/2/18.
//  Copyright © 2018 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ListTests: XCTestCase {
    func testListFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/List.json")
        let list = try? List.decode(data: fixture)

        XCTAssertEqual(list?.id, "42")
        XCTAssertEqual(list?.title, "nice list title")
    }

    func testListsFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Lists.json")
        let parsed = try? [List].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }
}
