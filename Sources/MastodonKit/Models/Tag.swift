//
//  Tag.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Tag {
    /// The hashtag, not including the preceding #.
    public let name: String
    /// The URL of the hashtag.
    public let url: String
}

extension Tag: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let name = dictionary["name"] as? String,
            let url = dictionary["url"] as? String
            else {
                return nil
        }

        self.name = name
        self.url = url
    }
}
