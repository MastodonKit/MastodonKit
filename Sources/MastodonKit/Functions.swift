import Foundation

// MARK: - Map

func toString(scope: AccessScope) -> String {
    return scope.rawValue
}

// MARK: - Flat-map

func toQueryItem(key: String, value: String?) -> URLQueryItem? {
    guard let value = value else { return nil }
    return URLQueryItem(name: key, value: value)
}

func toString(any: Any) -> String? {
    return any as? String
}

func toJSONDictionary(any: Any) -> JSONDictionary? {
    return any as? JSONDictionary
}

func toURL(string: String) -> URL? {
    return URL(string: string)
}
