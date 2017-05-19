import Foundation

public struct Notifications {
    /// Fetches a user's notifications.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Notification]`.
    public static func all(range: RequestRange = .default) -> Request<[Notification]> {
        let parameters = range.parameters(limit: between(1, and: 15, fallback: 30))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[Notification]>(path: "/api/v1/notifications", method: method, parse: Request<[Notification]>.parser)
    }

    /// Gets a single notification.
    ///
    /// - Parameter id: The notification id.
    /// - Returns: Request for `Notification`.
    public static func notification(id: Int) -> Request<Notification> {
        return Request<Notification>(path: "/api/v1/notifications/\(id)", parse: Request<Notification>.parser)
    }

    /// Deletes all notifications for the authenticated user.
    ///
    /// - Returns: Request for `Notification`.
    public static func dismissAll() -> Request<Notification> {
        return Request<Notification>(path: "/api/v1/notifications/clear", method: .post(.empty), parse: Request<Notification>.parser)
    }

    /// Deletes a single notification for the authenticated user.
    ///
    /// - Parameter id: The notification id.
    /// - Returns: Request for `Notification`.
    public static func dismiss(id: Int) -> Request<Notification> {
        return Request<Notification>(path: "/api/v1/notifications/dismiss/\(id)", method: .post(.empty), parse: Request<Notification>.parser)
    }
}
