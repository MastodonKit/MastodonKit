import Foundation

public struct Statuses {
    /// Fetches a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status?`.
    public static func status(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)", parse: StatusResource.parser)
    }

    /// Gets a status context.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Context?`.
    public static func context(id: Int) -> ContextResource {
        return ContextResource(path: "/api/v1/statuses/\(id)/context", parse: ContextResource.parser)
    }

    /// Gets a card associated with a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Card?`.
    public static func card(id: Int) -> CardResource {
        return CardResource(path: "/api/v1/statuses/\(id)/card", parse: CardResource.parser)
    }

    /// Gets who reblogged a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `[Account]`.
    public static func rebloggedBy(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/statuses/\(id)/reblogged_by", parse: AccountsResource.parser)
    }

    /// Gets who favourited a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `[Account]`.
    public static func favouritedBy(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/statuses/\(id)/favourited_by", parse: AccountsResource.parser)
    }
}
