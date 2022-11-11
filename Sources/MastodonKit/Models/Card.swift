//
//  Card.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Card: Codable {

    public enum PreviewType: String, Codable {
        /// Link OEmbed
        case link
        /// Photo OEmbed
        case photo
        /// Video OEmbed
        case video
        /// iframe OEmbed. Not currently accepted, so won't show up in practice.
        case rich
    }

    /// The url associated with the card.
    public let url: URL
    /// The title of the card.
    public let title: String
    /// The card description.
    public let description: String
    /// The image associated with the card, if any.
    public let image: URL?
    /// The type of the preview card.
    public let type: PreviewType?
    /// The author of the original resource.
    public let authorName: String?
    /// A link to the author of the original resource.
    public let authorURL: URL?
    /// The provider of the original resource.
    public let providerName: String?
    /// A link to the provider of the original resource.
    public let providerURL: URL?
    /// HTML to be used for generating the preview card.
    public let html: String?
    /// Width of preview, in pixels.
    public let width: Double?
    /// Height of preview, in pixels.
    public let height: Double?
    /// Used for photo embeds, instead of custom html.
    public let embedURL: URL?
    /// A hash computed by the [BlurHash](https://github.com/woltapp/blurhash) algorithm, for
    /// generating colorful preview thumbnails when media has not been downloaded yet.
    public let blurhash: String?

    private enum CodingKeys: String, CodingKey {
        case url
        case title
        case description
        case image
        case type
        case authorName = "author_name"
        case authorURL = "author_url"
        case providerName = "provider_name"
        case providerURL = "provider_url"
        case html
        case width
        case height
        case embedURL = "embed_url"
        case blurhash
    }

}
