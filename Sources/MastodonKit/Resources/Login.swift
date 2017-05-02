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
        let parameters = [
            Parameter(name: "client_id", value: clientID),
            Parameter(name: "client_secret", value: clientSecret),
            Parameter(name: "scope", value: scope.rawValue),
            Parameter(name: "grant_type", value: "password"),
            Parameter(name: "username", value: username),
            Parameter(name: "password", value: password)
        ]

        let method = HTTPMethod.post(Payload.parameters(parameters))
        return LoginSettingsResource(path: "/oauth/token", method: method, parse: LoginSettingsResource.parser)
    }
}
