//
//  DomainBlocks.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/5/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct DomainBlocks {
    /// Fetches a user's blocked domains.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[String]`.
    public static func all(range: RequestRange = .default) -> Request<[String]> {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[String]>(path: "/api/v1/domain_blocks", method: method, parse: Request<[String]>.parser)
    }

    /// Blocks a domain.
    ///
    /// - Parameter domain: The domain to block.
    /// - Returns: Request for `Empty`.
    public static func block(domain: String) -> Request<Empty> {
        let parameters = [Parameter(name: "domain", value: domain)]
        let method = HTTPMethod.post(.parameters(parameters))

        return Request<Empty>(path: "/api/v1/domain_blocks", method: method, parse: Request<Empty>.parser)
    }

    /// Unblocks a domain.
    ///
    /// - Parameter domain: The domain to unblock.
    /// - Returns: Request for `Empty`.
    public static func unblock(domain: String) -> Request<Empty> {
        let parameters = [Parameter(name: "domain", value: domain)]
        let method = HTTPMethod.delete(.parameters(parameters))

        return Request<Empty>(path: "/api/v1/domain_blocks", method: method, parse: Request<Empty>.parser)
    }
}
