import Foundation

public struct Blocks {
    /// Fetches a user's blocks.
    ///
    /// - Returns: Resource for fetching a user's blocks.
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/blocks", parameters: nil, parse: AccountsResource.parser)
    }
}
