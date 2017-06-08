//
//  NotificationTypeTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class NotificationTypeTests: XCTestCase {
    func testMention() {
        XCTAssertEqual(NotificationType(rawValue: "mention"), NotificationType.mention)
    }

    func testReblog() {
        XCTAssertEqual(NotificationType(rawValue: "reblog"), NotificationType.reblog)
    }

    func testFavourite() {
        XCTAssertEqual(NotificationType(rawValue: "favourite"), NotificationType.favourite)
    }

    func testFollow() {
        XCTAssertEqual(NotificationType(rawValue: "follow"), NotificationType.follow)
    }

    func testInvalidType() {
        XCTAssertNil(NotificationType(rawValue: "foobar"))
    }
}
