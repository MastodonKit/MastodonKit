import Foundation

// MARK: - Map

func toString(scope: AccessScope) -> String {
    return scope.rawValue
}

// MARK: - Flat-map

func asString(any: Any) -> String? {
    return any as? String
}

func asJSONDictionary(any: Any) -> JSONDictionary? {
    return any as? JSONDictionary
}

func asJSONDictionaries(any: Any) -> [JSONDictionary]? {
    return any as? [JSONDictionary]
}

func toQueryItem(key: String, value: String?) -> URLQueryItem? {
    guard let value = value else { return nil }
    return URLQueryItem(name: key, value: value)
}

func toURL(string: String) -> URL? {
    return URL(string: string)
}
