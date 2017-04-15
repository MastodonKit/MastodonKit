import XCTest
@testable import MastodonKit

class NotificationTests: XCTestCase {
    static var allTests = [
        ("testNotificationFromJSON", testNotificationFromJSON),
        ("testNotificationType", testNotificationType)
    ]

    var notificationFixture: Any!

    override func setUp() {
        super.setUp()
        notificationFixture = try? Fixture.load(fileName: "Fixtures/Notification.json")
    }

    func testNotificationFromJSON() {
        let dictionary = notificationFixture as! JSONDictionary
        let notification = Notification(json: dictionary)

        XCTAssertEqual(notification?.id, 42)
        XCTAssertEqual(notification?.type, NotificationType.favourite)
        XCTAssertNotNil(notification?.account)
        XCTAssertNotNil(notification?.status)
    }

    func testNotificationType() {
        XCTAssertEqual(NotificationType(string: "mention"), NotificationType.mention)
        XCTAssertEqual(NotificationType(string: "reblog"), NotificationType.reblog)
        XCTAssertEqual(NotificationType(string: "favourite"), NotificationType.favourite)
        XCTAssertEqual(NotificationType(string: "follow"), NotificationType.follow)
        XCTAssertEqual(NotificationType(string: "foobar"), NotificationType.unkonwn)
    }
}
