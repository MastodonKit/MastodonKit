import Foundation

public struct Reports {
    public static func all() -> ReportsResource {
        return ReportsResource(path: "/api/v1/reports", parameters: nil, parse: ReportsResource.parser)
    }
}
