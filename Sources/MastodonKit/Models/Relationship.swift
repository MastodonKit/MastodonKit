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
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? Int,
            let following = dictionary["following"] as? Bool,
            let followedBy = dictionary["followed_by"] as? Bool,
            let blocking = dictionary["blocking"] as? Bool,
            let muting = dictionary["muting"] as? Bool,
            let requested = dictionary["requested"] as? Bool
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
