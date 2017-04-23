import Foundation

public struct Notification {
    /// The notification ID.
    public let id: Int
    /// The notification type.
    public let type: NotificationType
    /// The time the notification was created.
    public let createdAt: Date
    /// The Account sending the notification to the user.
    public let account: Account
    /// The Status associated with the notification, if applicable.
    public let status: Status?
}

extension Notification {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? Int,
            let typeString = dictionary["type"] as? String,
            let createdAtString = dictionary["created_at"] as? String,
            let createdAt = DateFormatter.mastodonFormatter.date(from: createdAtString),
            let accountDictionary = dictionary["account"] as? JSONDictionary,
            let account = Account(from: accountDictionary)
            else {
                return nil
        }

        self.id = id
        self.type = NotificationType(string: typeString)
        self.createdAt = createdAt
        self.account = account
        self.status = dictionary["status"].flatMap(asJSONDictionary).flatMap(Status.init)
    }
}
