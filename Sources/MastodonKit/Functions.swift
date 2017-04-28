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

func toQueryItem(name: String, value: String?) -> URLQueryItem? {
    guard let value = value else { return nil }
    return URLQueryItem(name: name, value: value)
}

func toOptionalString<A>(optional: A?) -> String? {
    guard let value = optional else { return nil }
    return String(describing: value)
}

func toString(name: String, value: String?) -> String? {
    return value.flatMap { value in "\(name)=\(value)" }
}

func toQueryItems(parameter: Parameters) -> [URLQueryItem]? {
    return parameter.flatMap(toQueryItem)
}

func toData(parameter: Parameters) -> Data? {
    return parameter.flatMap(toString).joined(separator: "&").data(using: .utf8)
}

func nilOrTrue(_ flag: Bool) -> String? {
    return flag ? "true" : nil
}
