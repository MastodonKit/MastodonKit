import Foundation

public struct Reports {
    /// Fetches a user's reports.
    ///
    /// - Returns: Resource for `[Report]`.
    public static func all() -> ReportsResource {
        return ReportsResource(path: "/api/v1/reports", parse: ReportsResource.parser)
    }
}
