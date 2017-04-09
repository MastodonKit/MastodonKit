import Foundation

public struct Notifications {
    public static func all() -> NotificationsResource {
        return NotificationsResource(path: "/api/v1/notifications", parameters: nil, parse: NotificationsResource.parser)
    }

    public static func notification(id: Int) -> NotificationResource {
        return NotificationResource(path: "/api/v1/notifications/\(id)", parameters: nil, parse: NotificationResource.parser)
    }
}
