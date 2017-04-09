import Foundation

public struct Mutes {
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/mutes", parameters: nil, parse: AccountsResource.parser)
    }
}
