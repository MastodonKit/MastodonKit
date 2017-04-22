import Foundation

public struct Statuses {
    /// Fetches a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func status(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)", parse: StatusResource.parser)
    }

    /// Gets a status context.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Context`.
    public static func context(id: Int) -> ContextResource {
        return ContextResource(path: "/api/v1/statuses/\(id)/context", parse: ContextResource.parser)
    }

    /// Gets a card associated with a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Card`.
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

    /// Posts a new status.
    ///
    /// - Parameters:
    ///   - status: The text of the status.
    ///   - replyTo: The local ID of the status you want to reply to.
    ///   - sensitive: Marks the status as NSFW.
    ///   - spoilerText: the text to be shown as a warning before the actual content.
    ///   - visibility: The status' visibility.
    /// - Returns: Resource for `Status`.
    public static func create(status: String, replyToID: Int? = nil, sensitive: Bool? = nil, spoilerText: String? = nil, visibility: Visibility = .public) -> StatusResource {
        let dictionary: [String : String?] = [
            "status": status,
            "in_reply_to_id": String(optional: replyToID),
            "sensitive": String(optional: sensitive),
            "spoiler_text": spoilerText,
            "visibility": visibility.rawValue
        ]

        let parameters = dictionary.flatMap(toQueryItem)

        return StatusResource(path: "/api/v1/statuses", parameters: parameters, method: .post, parse: StatusResource.parser)
    }

    /// Deletes a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func delete(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)", method: .delete, parse: StatusResource.parser)
    }

    /// Reblogs a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func reblog(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/reblog", method: .post, parse: StatusResource.parser)
    }

    /// Unreblogs a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func unreblog(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/unreblog", method: .post, parse: StatusResource.parser)
    }

    /// Favourites a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func favourite(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/favourite", method: .post, parse: StatusResource.parser)
    }

    /// Unfavourites a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func unfavourite(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/unfavourite", method: .post, parse: StatusResource.parser)
    }
}
