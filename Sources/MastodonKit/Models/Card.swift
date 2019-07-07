//
//  Card.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Card: Codable {
    /// The url associated with the card.
    public var url: URL
    /// The title of the card.
    public var title: String
    /// The card description.
    public var description: String
    /// The image associated with the card, if any.
    public var image: URL?
}
