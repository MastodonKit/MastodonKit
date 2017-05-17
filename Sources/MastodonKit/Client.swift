import Foundation

public final class Client {
    let baseURL: String
    public var accessToken: String?
    lazy var session = URLSession.shared

    public init(baseURL: String, accessToken: String? = nil) {
        self.baseURL = baseURL
        self.accessToken = accessToken
    }

    public func run<Model>(_ request: Request<Model>, completion: @escaping (Model?, Error?) -> Void) {
        guard
            let components = URLComponents(baseURL: baseURL, request: request),
            let requestURL = components.url
            else {
                completion(nil, ClientError.malformedURL)
                return
        }

        let urlRequest = URLRequest(url: requestURL, request: request, accessToken: accessToken)

        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
                else {
                    completion(nil, ClientError.dataError)
                    return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
                else {
                    let mastodonError = MastodonError(json: jsonObject)
                    completion(nil, ClientError.mastodonError(mastodonError.description))
                    return
            }

            completion(request.parse(jsonObject), nil)
        }

        task.resume()
    }
}
