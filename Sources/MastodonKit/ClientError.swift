//
//  ClientError.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum ClientError: Error {
    /// Failed to build the URL to make the request.
    case malformedURL
    /// Failed to parse the Mastodon's JSON reponse.
    case malformedJSON
    /// Failed to parse Mastodon's model.
    case invalidModel
    /// The Mastodon service returned an error.
    case mastodonError(String)
}
