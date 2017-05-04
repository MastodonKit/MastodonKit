import Foundation

public struct Blocks {
    /// Fetches a user's blocks.
    ///
    /// - Returns: Resource for `[Account]`.
    public static func all(range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/blocks", method: method, parse: AccountsResource.parser)
    }
}
