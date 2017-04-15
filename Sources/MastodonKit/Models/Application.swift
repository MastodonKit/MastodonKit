import Foundation

public struct Application {
    public let name: String
    public let website: String?
}

extension Application {
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
