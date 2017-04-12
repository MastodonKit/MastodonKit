import Foundation

public struct Search {
    /// Searches for content.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - resolve: Whether to resolve non-local accounts.
    /// - Returns: Resource for `Results?`.
    public static func search(query: String, resolve: Bool = false) -> ResultsResource {
        let parameters = [URLQueryItem(name: "q", value: query), URLQueryItem(name: "resolve", value: String(resolve))]
        return ResultsResource(path: "/api/v1/search", parameters: parameters, parse: ResultsResource.parser)
    }
}
