import Foundation

extension URLRequest {
    init<A>(url: URL, resource: Resource<A>, accessToken: String?) {
        self.init(url: url, timeoutInterval: 30)

        httpMethod = resource.httpMethod.name
        httpBody = resource.httpMethod.httpBody

        setValue(accessToken.flatMap { "Bearer \($0)" }, forHTTPHeaderField: "Authorization")
        setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}
