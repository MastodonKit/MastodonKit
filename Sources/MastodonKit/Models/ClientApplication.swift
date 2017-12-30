//
//  ClientApplication.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class ClientApplication: Codable {
    /// The application ID.
    public let id: String
    /// Where the user should be redirected after authorization.
    public let redirectURI: String
    /// The application client ID.
    public let clientID: String
    /// The application client secret.
    public let clientSecret: String

    private enum CodingKeys: String, CodingKey {
        case id
        case redirectURI = "redirect_uri"
        case clientID = "client_id"
        case clientSecret = "client_secret"
    }
}
