//
//  Card.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Card {
    /// The url associated with the card.
    public let url: URL
    /// The title of the card.
    public let title: String
    /// The card description.
    public let description: String
    /// The image associated with the card, if any.
    public let image: URL?
}

extension Card: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let urlString = dictionary["url"] as? String,
            let url = URL(string: urlString),
            let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String
            else {
                return nil
        }

        self.url = url
        self.title = title
        self.description = description
        self.image = dictionary["image"].flatMap(asString).flatMap(URL.init)
    }
}
