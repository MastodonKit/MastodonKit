import Foundation

public struct Notifications {
    /// Fetches a user's notifications.
    ///
    /// - Returns: Resource for `[Notification]`.
    public static func all() -> NotificationsResource {
        return NotificationsResource(path: "/api/v1/notifications", parse: NotificationsResource.parser)
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
        return NotificationResource(path: "/api/v1/notifications/clear", method: .post, parse: NotificationResource.parser)
    }

    /// Deletes a single notification for the authenticated user.
    ///
    /// - Parameter id: The notification id.
    /// - Returns: Resource for `Notification`.
    public static func dismiss(id: Int) -> NotificationResource {
        return NotificationResource(path: "/api/v1/notifications/dismiss/\(id)", method: .post, parse: NotificationResource.parser)
    }
}
