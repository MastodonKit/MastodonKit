import Foundation

// MARK: - Map

func toString(scope: AccessScope) -> String {
    return scope.rawValue
}

// MARK: - Flat-map

func asString(json: JSONObject) -> String? {
    return json as? String
}

func asJSONDictionary(json: JSONObject) -> JSONDictionary? {
    return json as? JSONDictionary
}

func asJSONDictionaries(json: JSONObject) -> [JSONDictionary]? {
    return json as? [JSONDictionary]
}

func toQueryItem(key: String, value: String?) -> URLQueryItem? {
    guard let value = value else { return nil }
    return URLQueryItem(name: key, value: value)
}

func toURL(string: String) -> URL? {
    return URL(string: string)
}

func toOptionalString<A>(optional: A?) -> String? {
    guard let value = optional else { return nil }
    return String(describing: value)
}
