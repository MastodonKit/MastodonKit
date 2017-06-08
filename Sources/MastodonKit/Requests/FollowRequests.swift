//
//  FollowRequests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct FollowRequests {
    /// Fetches a list of follow requests.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func all(range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/follow_requests", method: method, parse: Request<[Account]>.parser)
    }

    /// Authorizes a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Request for `Empty`.
    public static func authorize(id: Int) -> Request<Empty> {
        return Request<Empty>(path: "/api/v1/follow_requests/\(id)/authorize", method: .post(.empty), parse: Request<Empty>.parser)
    }

    /// Rejects a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Request for `Empty`.
    public static func reject(id: Int) -> Request<Empty> {
        return Request<Empty>(path: "/api/v1/follow_requests/\(id)/reject", method: .post(.empty), parse: Request<Empty>.parser)
    }
}
