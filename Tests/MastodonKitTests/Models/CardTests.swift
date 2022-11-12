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

        XCTAssertEqual(card?.url, URL(string: "https://www.flickr.com/photos/tomfenskephotography/49088768431/"))
        XCTAssertEqual(card?.title, "Oregon")
        XCTAssertEqual(card?.description, "")
        XCTAssertEqual(card?.image, URL(string: "https://files.mastodon.social/preview_cards/images/014/287/139/original/651b1c6976817824.jpeg"))
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
