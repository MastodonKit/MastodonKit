//
//  NotificationTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class NotificationTests: XCTestCase {
    func testNotificationFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notification.json")
        let notification = try? MastodonKit.Notification.decode(data: fixture)

        XCTAssertEqual(notification?.id, "42")
        XCTAssertEqual(notification?.type, NotificationType.favourite)
        XCTAssertEqual(notification?.createdAt.timeIntervalSince1970, 1482239655.132)
        XCTAssertNotNil(notification?.account)
        XCTAssertNotNil(notification?.status)
    }

    func testNotificationWithInvalidData() {
        let parsed = try? MastodonKit.Notification.decode(data: Data())

        XCTAssertNil(parsed)
    }

    func testNotificationsFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notifications.json")
        let parsed = try? [MastodonKit.Notification].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testNotificationsWithInvalidData() {
        let parsed = try? [MastodonKit.Notification].decode(data: Data())

        XCTAssertNil(parsed)
    }
}
