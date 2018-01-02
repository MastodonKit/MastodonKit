//
//  CardTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class CardTests: XCTestCase {
    func testCardFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Card.json")
        let card = try? Card.decode(data: fixture)

        XCTAssertEqual(card?.url, URL(string: "http://lorempixel.com/200/200/cats/3/"))
        XCTAssertEqual(card?.title, "Awesome card title")
        XCTAssertEqual(card?.description, "Card description")
        XCTAssertEqual(card?.image, URL(string: "http://lorempixel.com/200/200/cats/1/"))
    }

    func testCardWithInvalidData() {
        let parsed = try? Card.decode(data: Data())

        XCTAssertNil(parsed)
    }
}
