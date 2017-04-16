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
        let accountsArray = json["accounts"] as? [JSONDictionary]
        self.accounts = accountsArray?.flatMap(Account.init)

        let statusesArray = json["statuses"] as? [JSONDictionary]
        self.statuses = statusesArray?.flatMap(Status.init)

        self.hashtags = json["hashtags"] as? [String]
    }
}
