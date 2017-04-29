import XCTest
@testable import MastodonKit

class NotificationsTests: XCTestCase {
    func testAll() {
        let resource = Notifications.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[MastodonKit.Notification]?>.self)
    }

    func testNotification() {
        let resource = Notifications.notification(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications/42")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }

    func testDismissAll() {
        let resource = Notifications.dismissAll()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications/clear")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }

    func testDismissWithID() {
        let resource = Notifications.dismiss(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications/dismiss/42")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }
}
