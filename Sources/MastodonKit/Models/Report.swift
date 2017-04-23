import Foundation

public struct Report {
    /// The ID of the report.
    public let id: Int
    /// The action taken in response to the report.
    public let actionTaken: String
}

extension Report {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? Int,
            let actionTaken = dictionary["action_taken"] as? String
            else {
                return nil
        }

        self.id = id
        self.actionTaken = actionTaken
    }
}
