//
//  PollTest.swift
//  MastodonKit
//
//  Created by Daniel Nitsikopoulos on 26/7/19.
//

import XCTest
@testable import MastodonKit

class PollTests: XCTestCase {
    func testPollFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Poll.json")
        let poll = try? Poll.decode(data: fixture)
        
        XCTAssertEqual(tag?.name, "mastodon")
        XCTAssertEqual(tag?.url, "https://mastodon.technology/web/timelines/tag/mastodonkit")
    }
    
    func testTagWithInvalidData() {
        let tag = try? Tag.decode(data: Data())
        
        XCTAssertNil(tag)
    }
}
