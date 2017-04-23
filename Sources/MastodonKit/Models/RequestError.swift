import Foundation

struct MastodonError {
    public let description: String
}

extension MastodonError {
    init(json: JSONObject) {
        let dictionary = json as? JSONDictionary
        self.description = dictionary?["error"].flatMap(asString) ?? ""
    }
}
