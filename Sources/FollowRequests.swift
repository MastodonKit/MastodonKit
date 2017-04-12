import Foundation

public struct FollowRequests {
    /// Fetches a list of follow requests.
    ///
    /// - Returns: Resource for fetching a list of follow requests.
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/follow_requests", parameters: nil, parse: AccountsResource.parser)
    }
}
