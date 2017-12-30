//
//  Login.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/18/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Login {
    /// Performs a silent login.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - clientSecret: The client secret.
    ///   - scopes: The access scopes.
    ///   - username: The user's username or e-mail address.
    ///   - password: The user's password.
    /// - Returns: Request for `LoginSettings`.
    public static func silent(clientID: String, clientSecret: String, scopes: [AccessScope], username: String, password: String) -> Request<LoginSettings> {
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
}
