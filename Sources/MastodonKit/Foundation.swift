import Foundation

extension URLComponents {
    init<A>(baseURL: String, resource: Resource<A>) {
        self.init(string: baseURL)!

        path = resource.path

        if let parameters = resource.parameters {
            queryItems = parameters
        }
    }
}
