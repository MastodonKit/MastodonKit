import Foundation

public struct Account {
    /// The ID of the account.
    public let id: Int

    /// The username of the account.
    public let username: String

    /// Equals username for local users, includes @domain for remote ones.
    public let acct: String

    /// The account's display name.
    public let displayName: String

    /// Biography of user.
    public let note: String

    /// URL of the user's profile page (can be remote).
    public let url: String

    /// URL to the avatar image.
    public let avatar: String

    /// URL to the header image.
    public let header: String

    /// Boolean for when the account cannot be followed without waiting for approval first.
    public let locked: Bool

    /// The number of followers for the account.
    public let followersCount: Int

    /// The number of accounts the given account is following.
    public let followingCount: Int

    /// The number of statuses the account has made.
    public let statusesCount: Int
}

extension Account {
    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let username = json["username"] as? String,
            let acct = json["acct"] as? String,
            let displayName = json["display_name"] as? String,
            let locked = json["locked"] as? Bool,
            let note = json["note"] as? String,
            let url = json["url"] as? String,
            let avatar = json["avatar"] as? String,
            let header = json["header"] as? String,
            let followersCount = json["followers_count"] as? Int,
            let followingCount = json["following_count"] as? Int,
            let statusesCount = json["statuses_count"] as? Int
            else {
                return nil
        }

        self.id = id
        self.username = username
        self.acct = acct
        self.displayName = displayName
        self.note = note
        self.url = url
        self.avatar = avatar
        self.header = header
        self.locked = locked
        self.followersCount = followersCount
        self.followingCount = followingCount
        self.statusesCount = statusesCount
    }
}
