import Foundation

public struct Reports {
    /// Fetches a user's reports.
    ///
    /// - Returns: Resource for fetching a user's reports.
    public static func all() -> ReportsResource {
        return ReportsResource(path: "/api/v1/reports", parameters: nil, parse: ReportsResource.parser)
    }
}
