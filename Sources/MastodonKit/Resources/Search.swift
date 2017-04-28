import Foundation

public struct Search {
    /// Searches for content.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - resolve: Whether to resolve non-local accounts.
    /// - Returns: Resource for `Results`.
    public static func search(query: String, resolve: Bool = false) -> ResultsResource {
        let dictionary: Parameters = ["q": query, "resolve": String(resolve)]
        let method = HTTPMethod.get(Payload.parameters(dictionary))

        return ResultsResource(path: "/api/v1/search", method: method, parse: ResultsResource.parser)
    }
}
