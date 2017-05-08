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
    /// - Parameters:
    ///   - id: The status id.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Account]`.
    public static func rebloggedBy(id: Int, range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/statuses/\(id)/reblogged_by", method: method, parse: AccountsResource.parser)
    }

    /// Gets who favourited a status.
    ///
    /// - Parameters:
    ///   - id: The status id.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Account]`.
    public static func favouritedBy(id: Int, range: ResourceRange = .default) -> AccountsResource {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return AccountsResource(path: "/api/v1/statuses/\(id)/favourited_by", method: method, parse: AccountsResource.parser)
    }

    /// Posts a new status.
    ///
    /// - Parameters:
    ///   - status: The text of the status.
    ///   - replyTo: The local ID of the status you want to reply to.
    ///   - mediaIDs: The array of media IDs to attach to the status (maximum 4).
    ///   - sensitive: Marks the status as NSFW.
    ///   - spoilerText: the text to be shown as a warning before the actual content.
    ///   - visibility: The status' visibility.
    /// - Returns: Resource for `Status`.
    public static func create(status: String, replyToID: Int? = nil, mediaIDs: [Int] = [], sensitive: Bool? = nil, spoilerText: String? = nil, visibility: Visibility = .public) -> StatusResource {
        let parameters = [
            Parameter(name: "status", value: status),
            Parameter(name: "in_reply_to_id", value: replyToID.flatMap(toOptionalString)),
            Parameter(name: "sensitive", value: sensitive.flatMap(nilOrTrue)),
            Parameter(name: "spoiler_text", value: spoilerText),
            Parameter(name: "visibility", value: visibility.rawValue)
            ] + mediaIDs.map(toArrayOfParameters(withName: "media_ids"))

        let method = HTTPMethod.post(Payload.parameters(parameters))
        return StatusResource(path: "/api/v1/statuses", method: method, parse: StatusResource.parser)
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
        return StatusResource(path: "/api/v1/statuses/\(id)/reblog", method: .post(.empty), parse: StatusResource.parser)
    }

    /// Unreblogs a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func unreblog(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/unreblog", method: .post(.empty), parse: StatusResource.parser)
    }

    /// Favourites a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func favourite(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/favourite", method: .post(.empty), parse: StatusResource.parser)
    }

    /// Unfavourites a status.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Resource for `Status`.
    public static func unfavourite(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)/unfavourite", method: .post(.empty), parse: StatusResource.parser)
    }
}
