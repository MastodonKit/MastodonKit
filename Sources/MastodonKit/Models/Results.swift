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
    init?(from dictionary: JSONDictionary) {
        self.accounts = dictionary["accounts"].flatMap(asJSONDictionaries)?.flatMap(Account.init)
        self.statuses = dictionary["statuses"].flatMap(asJSONDictionaries)?.flatMap(Status.init)
        self.hashtags = dictionary["hashtags"] as? [String]
    }
}
