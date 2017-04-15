import Foundation

public struct Mention {
    public let id: Int
    public let username: String
    public let acct: String
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
