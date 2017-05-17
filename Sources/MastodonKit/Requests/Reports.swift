import Foundation

public struct Reports {
    /// Fetches a user's reports.
    ///
    /// - Returns: Request for `[Report]`.
    public static func all() -> ReportsRequest {
        return ReportsRequest(path: "/api/v1/reports", parse: ReportsRequest.parser)
    }

    /// Reports a user.
    ///
    /// - Parameters:
    ///   - accountID: The ID of the account to report.
    ///   - statusIDs: The IDs of statuses to report.
    ///   - reason: A comment to associate with the report.
    /// - Returns: Request for `Report`.
    public static func report(accountID: Int, statusIDs: [Int], reason: String) -> ReportRequest {
        let parameters = [
            Parameter(name: "account_id", value: String(accountID)),
            Parameter(name: "comment", value: reason)
            ] + statusIDs.map(toArrayOfParameters(withName: "status_ids"))

        let method = HTTPMethod.post(Payload.parameters(parameters))
        return ReportRequest(path: "/api/v1/reports", method: method, parse: ReportRequest.parser)
    }
}
