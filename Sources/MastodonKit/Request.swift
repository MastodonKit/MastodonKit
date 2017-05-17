import Foundation

public struct Request<Model> {
    let path: String
    let method: HTTPMethod
    let parse: (JSONObject) -> Model?

    init(path: String, method: HTTPMethod = .get(.empty), parse: @escaping (JSONObject) -> Model?) {
        self.path = path
        self.method = method
        self.parse = parse
    }
}
