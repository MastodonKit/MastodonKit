import Foundation

public struct Mutes {
    /// Fetches a user's mutes.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Account]`.
    public static func all(range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/mutes", method: method, parse: AccountsResource.parser)
    }
}
