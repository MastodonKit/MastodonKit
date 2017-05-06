import Foundation

public struct FollowRequests {
    /// Fetches a list of follow requests.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Account]`.
    public static func all(range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/follow_requests", method: method, parse: AccountsResource.parser)
    }

    /// Authorizes a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Resource for `Account`.
    public static func authorize(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/follow_requests/\(id)/authorize", method: .post(Payload.empty), parse: AccountResource.parser)
    }

    /// Rejects a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Resource for `Account`.
    public static func reject(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/follow_requests/\(id)/reject", method: .post(Payload.empty), parse: AccountResource.parser)
    }
}
