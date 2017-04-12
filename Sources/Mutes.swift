import Foundation

public struct Mutes {
    /// Fetches a user's mutes.
    ///
    /// - Returns: Resource for `[Account]`.
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/mutes", parameters: nil, parse: AccountsResource.parser)
    }
}
