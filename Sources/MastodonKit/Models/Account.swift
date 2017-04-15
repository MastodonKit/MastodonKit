import Foundation

public struct Account {
    public let id: Int
    public let username: String
    public let acct: String
    public let displayName: String
    public let note: String
    public let url: String
    public let avatar: String
    public let header: String
    public let locked: Bool
    public let followersCount: Int
    public let followingCount: Int
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
