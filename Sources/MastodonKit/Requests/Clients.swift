//
//  Clients.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Clients {
    /// Registers an application.
    ///
    /// - Parameters:
    ///   - appName: Name of your application.
    ///   - redirectURI: Where the user should be redirected after authorization (for no redirect, omit this parameter).
    ///   - scopes: Application's access scopes.
    ///   - website: URL to the homepage of your app.
    /// - Returns: Request for `ClientApplication`.
    public static func register(clientName: String,
                                redirectURI: String = "urn:ietf:wg:oauth:2.0:oob",
                                scopes: [AccessScope],
                                website: String? = nil) -> Request<ClientApplication> {
        let parameters = [
            Parameter(name: "client_name", value: clientName),
            Parameter(name: "redirect_uris", value: redirectURI),
            Parameter(name: "website", value: website),
            Parameter(name: "scopes", value: scopes.map(toString).joined(separator: " "))
        ]

        let method = HTTPMethod.post(.parameters(parameters))
        return Request<ClientApplication>(path: "/api/v1/apps", method: method)
    }
}
