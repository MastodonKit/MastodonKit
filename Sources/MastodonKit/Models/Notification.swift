import Foundation

/// Notification type.
///
/// - mention: Status mentioned.
/// - reblog: Status reblogged.
/// - favourite: Status favourited.
/// - follow: User followed.
/// - unkonwn: Unkown action.
public enum NotificationType {
    case mention, reblog, favourite, follow, unkonwn
}

public struct Notification {
    /// The notification ID.
    public let id: Int

    /// The notification type.
    public let type: NotificationType

    /// The Account sending the notification to the user.
    public let account: Account

    /// The Status associated with the notification, if applicable.
    public let status: Status?
}

extension NotificationType {
    init(string: String) {
        switch string {
        case "mention":
            self = .mention
        case "reblog":
            self = .reblog
        case "favourite":
            self = .favourite
        case "follow":
            self = .follow
        default:
            self = .unkonwn
        }
    }
}

extension Notification {
    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let typeString = json["type"] as? String,
            let accountDictionary = json["account"] as? JSONDictionary,
            let account = Account(json: accountDictionary)
            else {
                return nil
        }

        self.id = id
        self.type = NotificationType(string: typeString)
        self.account = account

        let status = json["status"] as? JSONDictionary
        self.status = status != nil ? Status(json: status!) : nil
    }
}
