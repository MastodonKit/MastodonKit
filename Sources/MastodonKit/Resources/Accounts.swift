import Foundation

public struct Accounts {
    /// Fetches an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Account`.
    public static func account(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)", parse: AccountResource.parser)
    }

    /// Gets the current user.
    ///
    /// - Returns: Resource for `Account`.
    public static func currentUser() -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/verify_credentials", parse: AccountResource.parser)
    }

    /// Updates the current user.
    ///
    /// - Parameters:
    ///   - displayName: The name to display in the user's profile.
    ///   - note: A new biography for the user.
    ///   - avatar: A base64 encoded image to display as the user's avatar (e.g. data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAU...).
    ///   - header: A base64 encoded image to display as the user's header image (e.g. data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAU...).
    /// - Returns: Resource for `Account`.
    public static func updateCurrentUser(displayName: String? = nil, note: String? = nil, avatar: String? = nil, header: String? = nil) -> AccountResource {
        let parameters = [
            Parameter(name: "display_name", value: displayName),
            Parameter(name: "note", value: note),
            Parameter(name: "avatar", value: avatar),
            Parameter(name: "header", value: header)
        ]

        let method = HTTPMethod.patch(Payload.parameters(parameters))
        return AccountResource(path: "/api/v1/accounts/update_credentials", method: method, parse: AccountResource.parser)
    }

    /// Gets an account's followers.
    ///
    /// - Parameters:
    ///   - id: The account id.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Account]`.
    public static func followers(id: Int, range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/accounts/\(id)/followers", method: method, parse: AccountsResource.parser)
    }

    /// Gets who account is following.
    ///
    /// - Parameters:
    ///   - id: The account id
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Account]`.
    public static func following(id: Int, range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/accounts/\(id)/following", method: method, parse: AccountsResource.parser)
    }

    /// Gets an account's statuses.
    ///
    /// - Parameters:
    ///   - id: The account id.
    ///   - mediaOnly: Only return statuses that have media attachments.
    ///   - excludeReplies: Skip statuses that reply to other statuses.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Status]`.
    public static func statuses(id: Int, mediaOnly: Bool? = nil, excludeReplies: Bool? = nil, range: ResourceRange = .default) -> TimelineResource {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20)) ?? []
        let parameters = rangeParameters + [
            Parameter(name: "only_media", value: mediaOnly.flatMap(nilOrTrue)),
            Parameter(name: "exclude_replies", value: excludeReplies.flatMap(nilOrTrue))
        ]

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return TimelineResource(path: "/api/v1/accounts/\(id)/statuses", method: method, parse: TimelineResource.parser)
    }

    /// Follows an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Account`.
    public static func follow(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/follow", method: .post(Payload.empty), parse: AccountResource.parser)
    }

    /// Unfollow an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Account`.
    public static func unfollow(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unfollow", method: .post(Payload.empty), parse: AccountResource.parser)
    }

    /// Blocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Relationship`.
    public static func block(id: Int) -> RelationshipResource {
        return RelationshipResource(path: "/api/v1/accounts/\(id)/block", method: .post(Payload.empty), parse: RelationshipResource.parser)
    }

    /// Unblocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Relationship`.
    public static func unblock(id: Int) -> RelationshipResource {
        return RelationshipResource(path: "/api/v1/accounts/\(id)/unblock", method: .post(Payload.empty), parse: RelationshipResource.parser)
    }

    /// Mutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Relationship`.
    public static func mute(id: Int) -> RelationshipResource {
        return RelationshipResource(path: "/api/v1/accounts/\(id)/mute", method: .post(Payload.empty), parse: RelationshipResource.parser)
    }

    /// Unmutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `Relationship`.
    public static func unmute(id: Int) -> RelationshipResource {
        return RelationshipResource(path: "/api/v1/accounts/\(id)/unmute", method: .post(Payload.empty), parse: RelationshipResource.parser)
    }

    /// Gets an account's relationships.
    ///
    /// - Parameter ids: The account's ids.
    /// - Returns: Resource for `[Relationship]`.
    public static func relationships(ids: [Int]) -> RelationshipsResource {
        let parameters = ids.map(toArrayOfParameters(withName: "id"))

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return RelationshipsResource(path: "/api/v1/accounts/relationships", method: method, parse: RelationshipsResource.parser)
    }

    /// Searches for accounts.
    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - limit: Maximum number of matching accounts to return (default: 40).
    /// - Returns: Resource for `[Account]`.
    public static func search(query: String, limit: Int? = nil) -> AccountsResource {
        let toLimitBounds = between(1, and: 80, fallback: 40)
        let parameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "limit", value: limit.flatMap(toLimitBounds).flatMap(toOptionalString))
        ]

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return AccountsResource(path: "/api/v1/accounts/search", method: method, parse: AccountsResource.parser)
    }
}
