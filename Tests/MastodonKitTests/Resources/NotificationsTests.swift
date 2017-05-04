import XCTest
@testable import MastodonKit

class NotificationsTests: XCTestCase {
    func testAll() {
        let resource = Notifications.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[MastodonKit.Notification]?>.self)
    }

    func testAllWithRange() {
        let resource = Notifications.all(range: .max(id: 123, limit: 12))
        let expectedMaxID = URLQueryItem(name: "max_id", value: "123")
        let expectedLimit = URLQueryItem(name: "limit", value: "12")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedMaxID))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[MastodonKit.Notification]?>.self)
    }

    func testNotification() {
        let resource = Notifications.notification(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications/42")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }

    func testDismissAll() {
        let resource = Notifications.dismissAll()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications/clear")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }

    func testDismissWithID() {
        let resource = Notifications.dismiss(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/notifications/dismiss/42")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }
}
