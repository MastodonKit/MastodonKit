//
//  Favourites.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Favourites {
    /// Fetches a user's favourites.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func all(range: RequestRange = .default) -> Request<[Status]> {
        let parameters = range.parameters(limit: between(1, and: 40, default: 20))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Status]>(path: "/api/v1/favourites", method: method)
    }
}
