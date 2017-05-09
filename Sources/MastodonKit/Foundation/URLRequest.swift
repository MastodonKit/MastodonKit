import Foundation

extension URLRequest {
    init<A>(url: URL, resource: Resource<A>, accessToken: String?) {
        self.init(url: url, timeoutInterval: 30)

        httpMethod = resource.method.name
        httpBody = resource.method.httpBody

        setValue(accessToken.flatMap { "Bearer \($0)" }, forHTTPHeaderField: "Authorization")
        setValue(resource.method.contentType, forHTTPHeaderField: "Content-Type")
    }
}
