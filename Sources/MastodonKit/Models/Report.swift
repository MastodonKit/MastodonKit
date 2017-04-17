import Foundation

public struct Report {
    /// The ID of the report.
    public let id: Int
    /// The action taken in response to the report.
    public let actionTaken: String

    // MARK: - Private

    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let actionTaken = json["action_taken"] as? String
            else {
                return nil
        }

        self.id = id
        self.actionTaken = actionTaken
    }
}
