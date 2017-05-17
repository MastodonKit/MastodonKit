import Foundation

extension URLRequest {
    init<A>(url: URL, request: Request<A>, accessToken: String?) {
        self.init(url: url, timeoutInterval: 30)

        httpMethod = request.method.name
        httpBody = request.method.httpBody

        setValue(accessToken.flatMap { "Bearer \($0)" }, forHTTPHeaderField: "Authorization")
        setValue(request.method.contentType, forHTTPHeaderField: "Content-Type")
    }
}
