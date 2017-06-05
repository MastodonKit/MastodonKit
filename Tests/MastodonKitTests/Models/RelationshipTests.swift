//
//  RelationshipTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class RelationshipTests: XCTestCase {
    func testRelationshipFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Relationship.json")
        let dictionary = fixture as! JSONDictionary
        let relationship = Relationship(from: dictionary)!

        XCTAssertEqual(relationship.id, 42)
        XCTAssertFalse(relationship.following)
        XCTAssertFalse(relationship.followedBy)
        XCTAssertTrue(relationship.blocking)
        XCTAssertFalse(relationship.muting)
        XCTAssertTrue(relationship.mutingBoosts)
        XCTAssertFalse(relationship.requested)
    }
}
