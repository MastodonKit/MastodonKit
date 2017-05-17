import Foundation

public struct FollowRequests {
    /// Fetches a list of follow requests.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func all(range: RequestRange = .default) -> AccountsRequest {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsRequest(path: "/api/v1/follow_requests", method: method, parse: AccountsRequest.parser)
    }

    /// Authorizes a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Request for `Account`.
    public static func authorize(id: Int) -> AccountRequest {
        return AccountRequest(path: "/api/v1/follow_requests/\(id)/authorize", method: .post(.empty), parse: AccountRequest.parser)
    }

    /// Rejects a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Request for `Account`.
    public static func reject(id: Int) -> AccountRequest {
        return AccountRequest(path: "/api/v1/follow_requests/\(id)/reject", method: .post(.empty), parse: AccountRequest.parser)
    }
}
