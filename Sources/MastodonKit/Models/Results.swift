import Foundation

public struct Results {
    public let accounts: [Account]?
    public let statuses: [Status]?
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
