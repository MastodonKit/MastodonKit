import Foundation

typealias Parameters = [String : String?]

public struct Resource<Model> {
    let path: String
    let httpMethod: HTTPMethod
    let parse: (JSONObject) -> Model?
}

extension Resource {
    init(path: String, method: HTTPMethod = .get(Payload.empty), parse: @escaping (Any) -> Model?) {
        self.path = path
        self.httpMethod = method
        self.parse = parse
    }
}
