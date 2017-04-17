import Foundation

public struct Resource<Model> {
    let path: String
    let parameters: [URLQueryItem]?
    let httpMethod: HTTPMethod
    let parse: (Any) -> Model

    init(path: String, parameters: [URLQueryItem]? = nil, method: HTTPMethod = .get, parse: @escaping (Any) -> Model) {
        self.path = path
        self.parameters = parameters
        self.httpMethod = method
        self.parse = parse
    }
}
