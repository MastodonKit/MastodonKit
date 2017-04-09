import Foundation

public struct Accounts {
    public static func account(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)", parameters: nil, parse: AccountResource.parser)
    }

    public static func currentUser() -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/verify_credentials", parameters: nil, parse: AccountResource.parser)
    }

    public static func followers(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/accounts/\(id)/followers", parameters: nil, parse: AccountsResource.parser)
    }

    public static func following(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/accounts/\(id)/following", parameters: nil, parse: AccountsResource.parser)
    }

    public static func statuses(id: Int) -> TimelineResource {
        return TimelineResource(path: "/api/v1/accounts/\(id)/statuses", parameters: nil, parse: TimelineResource.parser)
    }

    public static func follow(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/follow", parameters: nil, parse: AccountResource.parser)
    }

    public static func unfollow(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unfollow", parameters: nil, parse: AccountResource.parser)
    }

    public static func block(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/block", parameters: nil, parse: AccountResource.parser)
    }

    public static func unblock(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unblock", parameters: nil, parse: AccountResource.parser)
    }

    public static func mute(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/mute", parameters: nil, parse: AccountResource.parser)
    }

    public static func unmute(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/accounts/\(id)/unmute", parameters: nil, parse: AccountResource.parser)
    }

    public static func search(query: String, limit: Int = 40) -> AccountsResource {
        let parameters = [URLQueryItem(name: "q", value: query), URLQueryItem(name: "limit", value: String(limit))]
        return AccountsResource(path: "/api/v1/accounts/search", parameters: parameters, parse: AccountsResource.parser)
    }
}
