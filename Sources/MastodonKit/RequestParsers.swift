//
//  RequestParsers.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

typealias JSONObject = Any
typealias JSONDictionary = [String: JSONObject]

protocol JSONDictionaryInitializer {
    init?(from dictionary: JSONDictionary)
}

extension Request where Model: JSONDictionaryInitializer {
    static func parser(json: JSONObject) -> Model? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Model(from: dictionary)
    }
}

extension Request where Model: Sequence, Model.Iterator.Element: JSONDictionaryInitializer {
    static func parser(json: JSONObject) -> [Model.Iterator.Element]? {
        guard let array = json as? [JSONDictionary] else { return nil }
        return array.flatMap(Model.Iterator.Element.init)
    }
}

extension Request where Model == [String] {
    static func parser(json: JSONObject) -> [String]? {
        return json as? [String]
    }
}
