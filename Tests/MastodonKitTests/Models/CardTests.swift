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
        let fixture = try? Fixture.load(fileName: "Fixtures/Card.json")
        let dictionary = fixture as! JSONDictionary
        let card = Card(from: dictionary)

        XCTAssertEqual(card?.url, URL(string: "http://lorempixel.com/200/200/cats/3/"))
        XCTAssertEqual(card?.title, "Awesome card title")
        XCTAssertEqual(card?.description, "Card description")
        XCTAssertEqual(card?.image, URL(string: "http://lorempixel.com/200/200/cats/1/"))
    }
}
