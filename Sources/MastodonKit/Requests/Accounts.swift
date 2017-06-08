//
//  Accounts.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Accounts {
    /// Fetches an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func account(id: Int) -> Request<Account> {
        return Request<Account>(path: "/api/v1/accounts/\(id)", parse: Request<Account>.parser)
    }

    /// Gets the current user.
    ///
    /// - Returns: Request for `Account`.
    public static func currentUser() -> Request<Account> {
        return Request<Account>(path: "/api/v1/accounts/verify_credentials", parse: Request<Account>.parser)
    }

    /// Updates the current user.
    ///
    /// - Parameters:
    ///   - displayName: The name to display in the user's profile.
    ///   - note: A new biography for the user.
    ///   - avatar: The media attachment to display as the user's avatar.
    ///   - header: The media attachment to display as the user's header image.
    /// - Returns: Request for `Account`.
    public static func updateCurrentUser(displayName: String? = nil,
                                         note: String? = nil,
                                         avatar: MediaAttachment? = nil,
                                         header: MediaAttachment? = nil) -> Request<Account> {
        let parameters = [
            Parameter(name: "display_name", value: displayName),
            Parameter(name: "note", value: note),
            Parameter(name: "avatar", value: avatar?.base64EncondedString),
            Parameter(name: "header", value: header?.base64EncondedString)
        ]

        let method = HTTPMethod.patch(.parameters(parameters))
        return Request<Account>(path: "/api/v1/accounts/update_credentials", method: method, parse: Request<Account>.parser)
    }

    /// Gets an account's followers.
    ///
    /// - Parameters:
    ///   - id: The account id.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func followers(id: Int, range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/accounts/\(id)/followers", method: method, parse: Request<[Account]>.parser)
    }

    /// Gets who account is following.
    ///
    /// - Parameters:
    ///   - id: The account id
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func following(id: Int, range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/accounts/\(id)/following", method: method, parse: Request<[Account]>.parser)
    }

    /// Gets an account's statuses.
    ///
    /// - Parameters:
    ///   - id: The account id.
    ///   - mediaOnly: Only return statuses that have media attachments.
    ///   - excludeReplies: Skip statuses that reply to other statuses.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func statuses(id: Int, mediaOnly: Bool? = nil, excludeReplies: Bool? = nil, range: RequestRange = .default) -> Request<[Status]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20)) ?? []
        let parameters = rangeParameters + [
            Parameter(name: "only_media", value: mediaOnly.flatMap(trueOrNil)),
            Parameter(name: "exclude_replies", value: excludeReplies.flatMap(trueOrNil))
        ]

        let method = HTTPMethod.get(.parameters(parameters))
        return Request<[Status]>(path: "/api/v1/accounts/\(id)/statuses", method: method, parse: Request<[Status]>.parser)
    }

    /// Follows an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func follow(id: Int) -> Request<Account> {
        return Request<Account>(path: "/api/v1/accounts/\(id)/follow", method: .post(.empty), parse: Request<Account>.parser)
    }

    /// Unfollow an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func unfollow(id: Int) -> Request<Account> {
        return Request<Account>(path: "/api/v1/accounts/\(id)/unfollow", method: .post(.empty), parse: Request<Account>.parser)
    }

    /// Blocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func block(id: Int) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/block", method: .post(.empty), parse: Request<Relationship>.parser)
    }

    /// Unblocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func unblock(id: Int) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/unblock", method: .post(.empty), parse: Request<Relationship>.parser)
    }

    /// Mutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func mute(id: Int) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/mute", method: .post(.empty), parse: Request<Relationship>.parser)
    }

    /// Unmutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func unmute(id: Int) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/unmute", method: .post(.empty), parse: Request<Relationship>.parser)
    }

    /// Gets an account's relationships.
    ///
    /// - Parameter ids: The account's ids.
    /// - Returns: Request for `[Relationship]`.
    public static func relationships(ids: [Int]) -> Request<[Relationship]> {
        let parameters = ids.map(toArrayOfParameters(withName: "id"))

        let method = HTTPMethod.get(.parameters(parameters))
        return Request<[Relationship]>(path: "/api/v1/accounts/relationships", method: method, parse: Request<[Relationship]>.parser)
    }

    /// Searches for accounts.
    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - limit: Maximum number of matching accounts to return (default: 40).
    /// - Returns: Request for `[Account]`.
    public static func search(query: String, limit: Int? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, fallback: 40)
        let parameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "limit", value: limit.flatMap(toLimitBounds).flatMap(toOptionalString))
        ]

        let method = HTTPMethod.get(.parameters(parameters))
        return Request<[Account]>(path: "/api/v1/accounts/search", method: method, parse: Request<[Account]>.parser)
    }
}
