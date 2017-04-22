import Foundation

public struct LoginSettings {
    public let accessToken: String
    public let accessTokenType: String
    public let scope: AccessScope
    public let createdAt: TimeInterval
}

extension LoginSettings {
    init?(json: JSONDictionary) {
        guard
            let accessToken = json["access_token"] as? String,
            let accessTokenType = json["token_type"] as? String,
            let accessScopeString = json["scope"] as? String,
            let createdAt = json["created_at"] as? TimeInterval
            else {
                return nil
        }

        self.accessToken = accessToken
        self.accessTokenType = accessTokenType
        self.scope = AccessScope(string: accessScopeString)
        self.createdAt = createdAt
    }
}
