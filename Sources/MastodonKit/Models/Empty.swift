//
//  Empty.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/7/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Empty { }

extension Empty: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard dictionary.isEmpty else { return nil }
    }
}
