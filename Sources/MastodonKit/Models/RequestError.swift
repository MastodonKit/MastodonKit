import Foundation

public struct MastodonError {
    public let description: String
}

extension MastodonError {
    init(jsonObject: Any) {
        let json = jsonObject as? JSONDictionary
        let description = json?["error"] as? String

        self.description = description ?? ""
    }
}
