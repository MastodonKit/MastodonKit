import Foundation

public enum NotificationType {
    case mention, reblog, favourite, follow, unkonwn
}

public struct Notification {
    public let id: Int
    public let type: NotificationType
    public let account: Account
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
