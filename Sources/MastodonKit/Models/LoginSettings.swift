import Foundation

public struct LoginSettings {
    /// The user's access token.
    public let accessToken: String
    /// Access token type.
    public let accessTokenType: String
    /// Access scope.
    public let scope: AccessScope
    /// Date when the access token was retrieved.
    public let createdAt: TimeInterval
}

extension LoginSettings {
    init?(from dictionary: JSONDictionary) {
        guard
            let accessToken = dictionary["access_token"] as? String,
            let accessTokenType = dictionary["token_type"] as? String,
            let accessScopeString = dictionary["scope"] as? String,
            let createdAt = dictionary["created_at"] as? TimeInterval
            else {
                return nil
        }

        self.accessToken = accessToken
        self.accessTokenType = accessTokenType
        self.scope = AccessScope(string: accessScopeString)
        self.createdAt = createdAt
    }
}
