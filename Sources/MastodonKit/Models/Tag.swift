import Foundation

public struct Tag {
    /// The hashtag, not including the preceding #.
    public let name: String
    /// The URL of the hashtag.
    public let url: String
}

extension Tag {
    init?(from dictionary: JSONDictionary) {
        guard
            let name = dictionary["name"] as? String,
            let url = dictionary["url"] as? String
            else {
                return nil
        }

        self.name = name
        self.url = url
    }
}
