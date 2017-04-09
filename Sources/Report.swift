import Foundation

public struct Report {
    public let id: Int
    public let actionTaken: String
}

extension Report {
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
