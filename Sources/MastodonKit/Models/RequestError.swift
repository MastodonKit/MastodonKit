import Foundation

public struct MastodonError {
    public let description: String
}

extension MastodonError {
    init(json: JSONObject) {
        let jsonDictionary = json as? JSONDictionary
        let description = jsonDictionary?["error"] as? String

        self.description = description ?? ""
    }
}
