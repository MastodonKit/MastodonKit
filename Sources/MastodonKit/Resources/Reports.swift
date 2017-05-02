import Foundation

public struct Reports {
    /// Fetches a user's reports.
    ///
    /// - Returns: Resource for `[Report]`.
    public static func all() -> ReportsResource {
        return ReportsResource(path: "/api/v1/reports", parse: ReportsResource.parser)
    }

    /// Reports a user.
    ///
    /// - Parameters:
    ///   - accountID: The ID of the account to report.
    ///   - statusIDs: The IDs of statuses to report.
    ///   - reason: A comment to associate with the report.
    /// - Returns: Resource for `Report`.
    public static func report(accountID: Int, statusIDs: [Int], reason: String) -> ReportResource {
        let parameters = [
            Parameter(name: "account_id", value: String(accountID)),
            Parameter(name: "comment", value: reason)
            ] + statusIDs.map(toArrayOfParameter(withName: "status_ids"))

        let method = HTTPMethod.post(Payload.parameters(parameters))
        return ReportResource(path: "/api/v1/reports", method: method, parse: ReportResource.parser)
    }
}
