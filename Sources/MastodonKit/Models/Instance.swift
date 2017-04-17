import Foundation

public struct Instance {
    /// URI of the current instance.
    public let uri: String
    /// The instance's title.
    public let title: String
    /// A description for the instance.
    public let description: String
    /// An email address which can be used to contact the instance administrator.
    public let email: String

    // MARK: - Private

    init?(json: JSONDictionary) {
        guard
            let uri = json["uri"] as? String,
            let title = json["title"] as? String,
            let description = json["description"] as? String,
            let email = json["email"] as? String
            else {
                return nil
        }

        self.uri = uri
        self.title = title
        self.description = description
        self.email = email
    }
}
