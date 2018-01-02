//
//  RelationshipTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class RelationshipTests: XCTestCase {
    func testRelationshipFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationship.json")
        let relationship = try? Relationship.decode(data: fixture)

        XCTAssertEqual(relationship?.id, "42")
        XCTAssertFalse((relationship?.following)!)
        XCTAssertFalse((relationship?.followedBy)!)
        XCTAssertTrue((relationship?.blocking)!)
        XCTAssertFalse((relationship?.muting)!)
        XCTAssertTrue((relationship?.mutingNotifications)!)
        XCTAssertFalse((relationship?.requested)!)
        XCTAssertTrue((relationship?.domainBlocking)!)
    }

    func testRelationshipWithInvalidData() {
        let parsed = try? Relationship.decode(data: Data())

        XCTAssertNil(parsed)
    }

    func testRelationshipsFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationships.json")
        let parsed = try? [Relationship].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testRelationshipsWithInvalidData() {
        let parsed = try? [Relationship].decode(data: Data())

        XCTAssertNil(parsed)
    }
}
