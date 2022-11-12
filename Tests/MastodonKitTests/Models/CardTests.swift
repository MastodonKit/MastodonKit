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
        XCTAssertEqual(card?.authorName, "Tom Fenske Photography")
        XCTAssertEqual(card?.authorURL,  "https://www.flickr.com/photos/tomfenskephotography/")
        XCTAssertEqual(card?.providerName, "Flickr")
        XCTAssertEqual(card?.providerURL, "https://www.flickr.com/")
        XCTAssertEqual(card?.embedURL, URL(string: "https://live.staticflickr.com/65535/49088768431_6a4322b3bb_b.jpg"))
        XCTAssertEqual(card?.width, 1024)
        XCTAssertEqual(card?.height, 427)
        XCTAssertEqual(card?.blurhash, "UnE{@jt6M_oIAhjYs+ayT2WBf9ayRkkDXAj[")
        XCTAssertEqual(card?.html, "")
        XCTAssertEqual(card?.type, .photo)
    }

    func testCardWithInvalidData() {
        let parsed = try? Card.decode(data: Data())

        XCTAssertNil(parsed)
    }
}
