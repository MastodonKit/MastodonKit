//
//  Functions.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/13/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

// MARK: - Map

func toString(scope: AccessScope) -> String {
    return scope.rawValue
}

func toArrayOfParameters<A>(withName name: String) -> (A) -> Parameter {
    return { value in Parameter(name: "\(name)[]", value: String(describing: value)) }
}

func between(_ min: Int, and max: Int, default: Int) -> (Int) -> Int {
    return { limit in (limit >= min && limit <= max) ? limit : `default` }
}

// MARK: - Flat-map

func toOptionalString<A>(optional: A?) -> String? {
    return optional.flatMap(String.init(describing:))
}

func toQueryItem(parameter: Parameter) -> URLQueryItem? {
    guard let value = parameter.value else { return nil }
    return URLQueryItem(name: parameter.name, value: value)
}

func toString(parameter: Parameter) -> String? {
    return parameter.value?
        .addingPercentEncoding(withAllowedCharacters: .bodyAllowed)
        .flatMap { value in "\(parameter.name)=\(value)" }
}

func trueOrNil(_ flag: Bool) -> String? {
    return flag ? "true" : nil
}

func trim(left: Character, right: Character) -> (String) -> String {
    return { string in
        guard string.hasPrefix("\(left)"), string.hasSuffix("\(right)") else { return string }
        return String(string[string.index(after: string.startIndex)..<string.index(before: string.endIndex)])
    }
}

func toInteger(item: URLQueryItem) -> Int? {
    guard let value = item.value else { return nil }
    return Int(value)
}

func toAccessScope(string: String) -> AccessScope? {
    return AccessScope(rawValue: string)
}
