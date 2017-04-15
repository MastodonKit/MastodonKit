import Foundation

public struct Instance {
    public let uri: String
    public let title: String
    public let description: String
    public let email: String
}

extension Instance {
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
