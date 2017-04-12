import Foundation

public struct Accounts {
    /// Fetches an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for fetching an account.
    public static func account(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)", parameters: nil, parse: AccountResource.parser)
    }

    /// Gets the current user.
    ///
    /// - Returns: Resource for getting the current user.
    public static func currentUser() -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/verify_credentials", parameters: nil, parse: AccountResource.parser)
    }

    /// Gets an account's followers.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for getting an account's followers.
    public static func followers(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/accounts/\(id)/followers", parameters: nil, parse: AccountsResource.parser)
    }

    /// Gets who account is following.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for getting who account is following.
    public static func following(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/accounts/\(id)/following", parameters: nil, parse: AccountsResource.parser)
    }

    /// Gets an account's statuses.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for getting an account's statuses.
    public static func statuses(id: Int) -> TimelineResource {
        return TimelineResource(path: "/api/v1/accounts/\(id)/statuses", parameters: nil, parse: TimelineResource.parser)
    }

    /// Follows an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for following an account.
    public static func follow(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/follow", parameters: nil, parse: AccountResource.parser)
    }

    /// Unfollow an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for unfollowing an account.
    public static func unfollow(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unfollow", parameters: nil, parse: AccountResource.parser)
    }

    /// Blocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for blocking an account.
    public static func block(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/block", parameters: nil, parse: AccountResource.parser)
    }

    /// Unblocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for unblocking an account.
    public static func unblock(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unblock", parameters: nil, parse: AccountResource.parser)
    }

    /// Mutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for muting an account.
    public static func mute(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/mute", parameters: nil, parse: AccountResource.parser)
    }

    /// Unmutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Resource for unmuting an account.
    public static func unmute(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unmute", parameters: nil, parse: AccountResource.parser)
    }

    /// Searches for accounts.
    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - limit: Maximum number of matching accounts to return (default: 40).
    /// - Returns: Resource for searching for accounts.
    public static func search(query: String, limit: Int = 40) -> AccountsResource {
        let parameters = [URLQueryItem(name: "q", value: query), URLQueryItem(name: "limit", value: String(limit))]
        return AccountsResource(path: "/api/v1/accounts/search", parameters: parameters, parse: AccountsResource.parser)
    }
}
