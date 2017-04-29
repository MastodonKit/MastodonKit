import Foundation

extension URLComponents {
    init?<A>(baseURL: String, resource: Resource<A>) {
        guard
            let realBaseURL = URL(string: baseURL),
            let completeURL = URL(string: resource.path, relativeTo: realBaseURL)
            else {
                return nil
        }

        self.init(url: completeURL, resolvingAgainstBaseURL: true)

        path = resource.path
        queryItems = resource.method.queryItems
    }
}
