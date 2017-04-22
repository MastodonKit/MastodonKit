import Foundation

public struct Mention {
    /// Account ID.
    public let id: Int
    /// The username of the account.
    public let username: String
    /// Equals username for local users, includes @domain for remote ones.
    public let acct: String
    /// URL of user's profile (can be remote).
    public let url: String
}

extension Mention {
    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let username = json["username"] as? String,
            let acct = json["acct"] as? String,
            let url = json["url"] as? String
            else {
                return nil
        }

        self.id = id
        self.username = username
        self.acct = acct
        self.url = url
    }
}
