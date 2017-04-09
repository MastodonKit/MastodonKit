import Foundation

public struct Blocks {
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/blocks", parameters: nil, parse: AccountsResource.parser)
    }
}
