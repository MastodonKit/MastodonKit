import Foundation

public struct Statuses {
    public static func status(id: Int) -> StatusResource {
        return StatusResource(path: "/api/v1/statuses/\(id)", parameters: nil, parse: StatusResource.parser)
    }

    public static func context(id: Int) -> ContextResource {
        return ContextResource(path: "/api/v1/statuses/\(id)/context", parameters: nil, parse: ContextResource.parser)
    }

    public static func card(id: Int) -> CardResource {
        return CardResource(path: "/api/v1/statuses/\(id)/card", parameters: nil, parse: CardResource.parser)
    }

    public static func rebloggedBy(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/statuses/\(id)/reblogged_by", parameters: nil, parse: AccountsResource.parser)
    }

    public static func favouritedBy(id: Int) -> AccountsResource {
        return AccountsResource(path: "/api/v1/statuses/\(id)/favourited_by", parameters: nil, parse: AccountsResource.parser)
    }
}
