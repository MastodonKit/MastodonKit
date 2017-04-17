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
    static func mastodonDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        return dateFormatter
    }
}

extension Date {
    init?(fromMastodonJSON dateString: String) {
        let formatter = DateFormatter.mastodonDateFormatter()

        guard let date = formatter.date(from: dateString) else {
            return nil
        }

        self.init(timeInterval: 0, since: date)
    }
}
