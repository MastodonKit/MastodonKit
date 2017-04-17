import Foundation

public struct Application {
    /// Name of the app.
    public let name: String
    /// Homepage URL of the app.
    public let website: String?

    // MARK: - Private

    init?(json: JSONDictionary) {
        guard
            let name = json["name"] as? String
            else {
                return nil
        }

        self.name = name
        self.website = json["website"] as? String
    }
}
