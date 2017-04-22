import Foundation

public struct Results {
    /// An array of matched accounts.
    public let accounts: [Account]?
    /// An array of matchhed statuses.
    public let statuses: [Status]?
    /// An array of matched hashtags, as strings.
    public let hashtags: [String]?
}

extension Results {
    init?(json: JSONDictionary) {
        self.accounts = json["accounts"].flatMap(asJSONDictionaries)?.flatMap(Account.init)
        self.statuses = json["statuses"].flatMap(asJSONDictionaries)?.flatMap(Status.init)
        self.hashtags = json["hashtags"] as? [String]
    }
}
