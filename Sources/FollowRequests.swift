import Foundation

public struct FollowRequests {
    public static func requests() -> AccountsResource {
        return AccountsResource(path: "/api/v1/follow_requests", parameters: nil, parse: AccountsResource.parser)
    }
}
