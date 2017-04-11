import Foundation

public struct FollowRequests {
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/follow_requests", parameters: nil, parse: AccountsResource.parser)
    }
}
