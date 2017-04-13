import Foundation

public struct Blocks {
    /// Fetches a user's blocks.
    ///
    /// - Returns: Resource for `[Account]`.
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/blocks", parse: AccountsResource.parser)
    }
}
