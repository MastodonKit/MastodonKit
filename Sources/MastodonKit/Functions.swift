import Foundation

// MARK: - Flat-map

func toQueryItem(key: String, value: String?) -> URLQueryItem? {
    guard let value = value else { return nil }
    return URLQueryItem(name: key, value: value)
}

func toString(scope: AccessScope) -> String {
    return scope.rawValue
}
