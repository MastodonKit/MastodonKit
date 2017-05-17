import Foundation

public struct Search {
    /// Searches for content.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - resolve: Whether to resolve non-local accounts.
    /// - Returns: Request for `Results`.
    public static func search(query: String, resolve: Bool? = nil) -> ResultsRequest {
        let parameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "resolve", value: resolve.flatMap(trueOrNil))
        ]

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return ResultsRequest(path: "/api/v1/search", method: method, parse: ResultsRequest.parser)
    }
}
