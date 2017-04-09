import Foundation

public struct Search {
    public static func search(query: String, resolve: Bool = false) -> ResultsResource {
        let parameters = [URLQueryItem(name: "q", value: query), URLQueryItem(name: "resolve", value: String(resolve))]
        return ResultsResource(path: "/api/v1/search", parameters: parameters, parse: ResultsResource.parser)
    }
}
