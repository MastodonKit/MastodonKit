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

    // MARK: - Private

    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let typeString = json["type"] as? String,
            let createdAtString = json["created_at"] as? String,
            let createdAt = Date(fromMastodonJSON: createdAtString),
            let accountDictionary = json["account"] as? JSONDictionary,
            let account = Account(json: accountDictionary)
            else {
                return nil
        }

        self.id = id
        self.type = NotificationType(string: typeString)
        self.createdAt = createdAt
        self.account = account

        let status = json["status"] as? JSONDictionary
        self.status = status != nil ? Status(json: status!) : nil
    }
}
