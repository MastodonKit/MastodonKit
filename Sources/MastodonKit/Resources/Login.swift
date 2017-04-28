import Foundation

public struct Login {
    /// Performs a silent login.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - clientSecret: The client secret.
    ///   - scope: The access scope.
    ///   - username: The user's username or e-mail address.
    ///   - password: The user's password.
    /// - Returns: Resource for `LoginSettings`.
    public static func silent(clientID: String, clientSecret: String, scope: AccessScope, username: String, password: String) -> LoginSettingsResource {
        let dictionary: Parameters = [
            "client_id": clientID,
            "client_secret": clientSecret,
            "scope": scope.rawValue,
            "grant_type": "password",
            "username": username,
            "password": password
        ]

        let method = HTTPMethod.post(Payload.parameters(dictionary))
        return LoginSettingsResource(path: "/oauth/token", method: method, parse: LoginSettingsResource.parser)
    }
}
