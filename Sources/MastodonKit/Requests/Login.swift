//
//  Login.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/18/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

/// `Login` requests.
public enum Login {
    /// Performs a silent login.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - clientSecret: The client secret.
    ///   - scopes: The access scopes.
    ///   - username: The user's username or e-mail address.
    ///   - password: The user's password.
    /// - Returns: Request for `LoginSettings`.
    public static func silent(clientID: String,
                              clientSecret: String,
                              scopes: [AccessScope],
                              username: String,
                              password: String) -> Request<LoginSettings> {
        let parameters = [
            Parameter(name: "client_id", value: clientID),
            Parameter(name: "client_secret", value: clientSecret),
            Parameter(name: "scope", value: scopes.map(toString).joined(separator: " ")),
            Parameter(name: "grant_type", value: "password"),
            Parameter(name: "username", value: username),
            Parameter(name: "password", value: password)
        ]

        let method = HTTPMethod.post(.parameters(parameters))
        return Request<LoginSettings>(path: "/oauth/token", method: method)
    }

    /// Completes an OAuth login.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - clientSecret: The client secret.
    ///   - scopes: The access scopes.
    ///   - redirectURI: The client redirectURI.
    ///   - code: The authorization code.
    /// - Returns: Request for `LoginSettings`.
    public static func oauth(clientID: String,
                             clientSecret: String,
                             scopes: [AccessScope],
                             redirectURI: String,
                             code: String) -> Request<LoginSettings> {
        let parameters = [
            Parameter(name: "client_id", value: clientID),
            Parameter(name: "client_secret", value: clientSecret),
            Parameter(name: "scope", value: scopes.map(toString).joined(separator: " ")),
            Parameter(name: "grant_type", value: "authorization_code"),
            Parameter(name: "redirect_uri", value: redirectURI),
            Parameter(name: "code", value: code)
        ]

        let method = HTTPMethod.post(.parameters(parameters))
        return Request<LoginSettings>(path: "/oauth/token", method: method)
    }
    
    /// Logs the user out.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - clientSecret: The client secret.
    ///   - loginSettings: The previously obtained loginSettings, to be invalidated.
    public static func revokeOauth(clientID: String,
                             clientSecret: String,
                             token: String) -> Request<Empty> {
        let parameters = [
            Parameter(name: "client_id", value: clientID),
            Parameter(name: "client_secret", value: clientSecret),
            Parameter(name: "token", value: token)
        ]

        let method = HTTPMethod.post(.parameters(parameters))
        return Request<Empty>(path: "/oauth/revoke", method: method)
    }
}
