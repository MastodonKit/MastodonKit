import Foundation

public struct Statuses {
    /// Fetches a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for fetching a status.
    public static func status(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)", parameters: nil, parse: StatusResource.parser)
    }

    /// Gets a status context.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for getting a status context.
    public static func context(id: Int) -> ContextResource {
        return ContextResource(path: "/api/v1/statuses/\(id)/context", parameters: nil, parse: ContextResource.parser)
    }

    /// Gets a card associated with a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for getting a card associated with a status.
    public static func card(id: Int) -> CardResource {
        return CardResource(path: "/api/v1/statuses/\(id)/card", parameters: nil, parse: CardResource.parser)
    }

    /// Gets who reblogged a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for getting who reblogged a status.
    public static func rebloggedBy(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/statuses/\(id)/reblogged_by", parameters: nil, parse: AccountsResource.parser)
    }

    /// Gets who favourited a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for getting who favourited a status.
    public static func favouritedBy(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/statuses/\(id)/favourited_by", parameters: nil, parse: AccountsResource.parser)
    }
}
