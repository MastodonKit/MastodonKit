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

extension DateFormatter {
    static let mastodonFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        return dateFormatter
    }()
}
