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
        let dictionary: Parameters = [
            "display_name": displayName,
            "note": note,
            "avatar": avatar,
            "header": header
        ]

        let method = HTTPMethod.patch(Payload.parameters(dictionary))
        return AccountResource(path: "/api/v1/accounts/update_credentials", method: method, parse: AccountResource.parser)
    }

    /// Gets an account's followers.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `[Account]`.
    public static func followers(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/accounts/\(id)/followers", parse: AccountsResource.parser)
    }

    /// Gets who account is following.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `[Account]`.
    public static func following(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/accounts/\(id)/following", parse: AccountsResource.parser)
    }

    /// Gets an account's statuses.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for `[Status]`.
    public static func statuses(id: Int) -> TimelineResource {
        return TimelineResource(path: "/api/v1/accounts/\(id)/statuses", parse: TimelineResource.parser)
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
    /// - Parameter id: The accound id.
    /// - Returns: Resource for `[Relationship]`.
    public static func relationships(id: Int) -> RelationshipsResource {
        let dictionary: Parameters = ["id": String(id)]
        let method = HTTPMethod.get(Payload.parameters(dictionary))

        return RelationshipsResource(path: "/api/v1/accounts/relationships", method: method, parse: RelationshipsResource.parser)
    }

    /// Searches for accounts.
    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - limit: Maximum number of matching accounts to return (default: 40).
    /// - Returns: Resource for `[Account]`.
    public static func search(query: String, limit: Int = 40) -> AccountsResource {
        let dictionary: Parameters = ["q": query, "limit": String(limit)]
        let method = HTTPMethod.get(Payload.parameters(dictionary))

        return AccountsResource(path: "/api/v1/accounts/search", method: method, parse: AccountsResource.parser)
    }
}
