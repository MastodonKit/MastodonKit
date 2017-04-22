import Foundation

public struct Relationship {
    /// Target account id.
    public let id: Int
    /// Whether the user is currently following the account.
    public let following: Bool
    /// Whether the user is currently being followed by the account.
    public let followedBy: Bool
    /// Whether the user is currently blocking the account.
    public let blocking: Bool
    /// Whether the user is currently muting the account.
    public let muting: Bool
    /// Whether the user has requested to follow the account.
    public let requested: Bool
}

extension Relationship {
    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let following = json["following"] as? Bool,
            let followedBy = json["followed_by"] as? Bool,
            let blocking = json["blocking"] as? Bool,
            let muting = json["muting"] as? Bool,
            let requested = json["requested"] as? Bool
            else {
                return nil
        }

        self.id = id
        self.following = following
        self.followedBy = followedBy
        self.blocking = blocking
        self.muting = muting
        self.requested = requested
    }
}
