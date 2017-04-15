import Foundation

public struct Resource<Model> {
    let path: String
    let parameters: [URLQueryItem]?
    let httpMethod: HTTPMethod
    let parse: (Any) -> Model

    init(path: String, parameters: [URLQueryItem]? = nil, httpMethod: HTTPMethod = .get, parse: @escaping (Any) -> Model) {
        self.path = path
        self.parameters = parameters
        self.httpMethod = httpMethod
        self.parse = parse
    }
}

extension URLComponents {
    init<A>(baseURL: String, resource: Resource<A>) {
        self.init(string: baseURL)!

        path = resource.path

        if let parameters = resource.parameters {
            queryItems = parameters
        }
    }
}

public final class MastodonClient {
    let baseURL: String
    let accessToken: String

    public init(baseURL: String, accessToken: String) {
        self.baseURL = baseURL
        self.accessToken = accessToken
    }

    public func run<Model>(_ resource: Resource<Model>, completion: @escaping (Model) -> Void) {
        let components = URLComponents(baseURL: baseURL, resource: resource)

        var request = URLRequest(url: components.url!, timeoutInterval: 30)
        request.httpMethod = resource.httpMethod.toString()
        request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                completion(resource.parse(jsonObject))
            }
        }

        task.resume()
    }
}
