import Foundation

public enum NotificationType {
    /// The user has been mentioned.
    case mention
    /// The status message has been reblogged.
    case reblog
    /// The status message has been favourited.
    case favourite
    /// The user has a new follower.
    case follow
    /// Unknown notification type.
    case unknown
}

extension NotificationType {
    init(string: String) {
        switch string {
        case "mention": self = .mention
        case "reblog": self = .reblog
        case "favourite": self = .favourite
        case "follow": self = .follow
        default: self = .unknown
        }
    }
}
