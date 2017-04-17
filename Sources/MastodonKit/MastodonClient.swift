import Foundation

public final class MastodonClient {
    let baseURL: String
    public var accessToken: String?

    public init(baseURL: String, accessToken: String? = nil) {
        self.baseURL = baseURL
        self.accessToken = accessToken
    }

    public func run<Model>(_ resource: Resource<Model>, completion: @escaping (Model) -> Void) {
        let components = URLComponents(baseURL: baseURL, resource: resource)

        var request = URLRequest(url: components.url!, timeoutInterval: 30)
        request.httpMethod = resource.httpMethod.stringValue

        if let accessToken = accessToken {
            request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        }

        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                completion(resource.parse(jsonObject))
            }
        }

        task.resume()
    }
}
