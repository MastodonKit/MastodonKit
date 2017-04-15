import Foundation

public struct Relationship {
    public let following: Bool
    public let followedBy: Bool
    public let blocking: Bool
    public let muting: Bool
    public let requested: Bool
}

extension Relationship {
    init?(json: JSONDictionary) {
        guard
            let following = json["following"] as? Bool,
            let followedBy = json["followed_by"] as? Bool,
            let blocking = json["blocking"] as? Bool,
            let muting = json["muting"] as? Bool,
            let requested = json["requested"] as? Bool
            else {
                return nil
        }

        self.following = following
        self.followedBy = followedBy
        self.blocking = blocking
        self.muting = muting
        self.requested = requested
    }
}
