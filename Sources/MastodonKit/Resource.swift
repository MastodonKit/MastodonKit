import Foundation

public struct Resource<Model> {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case patch = "PATCH"
    }

    let path: String
    let parameters: [URLQueryItem]?
    let httpMethod: HTTPMethod
    let parse: (JSONObject) -> Model?

    init(path: String, parameters: [URLQueryItem]? = nil, method: HTTPMethod = .get, parse: @escaping (Any) -> Model?) {
        self.path = path
        self.parameters = parameters
        self.httpMethod = method
        self.parse = parse
    }
}
