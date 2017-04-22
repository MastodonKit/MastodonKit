import Foundation

public enum NotificationType {
    case mention, reblog, favourite, follow, unknown
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
