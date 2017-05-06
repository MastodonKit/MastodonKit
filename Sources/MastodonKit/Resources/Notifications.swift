import Foundation

public struct Notifications {
    /// Fetches a user's notifications.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Notification]`.
    public static func all(range: ResourceRange = .default) -> NotificationsResource {
        let parameters = range.parameters(limit: between(1, and: 15, fallback: 30))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return NotificationsResource(path: "/api/v1/notifications", method: method, parse: NotificationsResource.parser)
    }

    /// Gets a single notification.
    ///
    /// - Parameter id: The notification id.
    /// - Returns: Resource for `Notification`.
    public static func notification(id: Int) -> NotificationResource {
        return NotificationResource(path: "/api/v1/notifications/\(id)", parse: NotificationResource.parser)
    }

    /// Deletes all notifications for the authenticated user.
    ///
    /// - Returns: Resource for `Notification`.
    public static func dismissAll() -> NotificationResource {
        return NotificationResource(path: "/api/v1/notifications/clear", method: .post(Payload.empty), parse: NotificationResource.parser)
    }

    /// Deletes a single notification for the authenticated user.
    ///
    /// - Parameter id: The notification id.
    /// - Returns: Resource for `Notification`.
    public static func dismiss(id: Int) -> NotificationResource {
        return NotificationResource(path: "/api/v1/notifications/dismiss/\(id)", method: .post(Payload.empty), parse: NotificationResource.parser)
    }
}
