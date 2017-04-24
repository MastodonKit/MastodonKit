import Foundation

struct MastodonError {
    /// Reason why Mastodon returned an error.
    let description: String
}

extension MastodonError {
    init(json: JSONObject) {
        let dictionary = json as? JSONDictionary
        self.description = dictionary?["error"].flatMap(asString) ?? ""
    }
}
