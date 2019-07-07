//
//  Attachment.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Attachment: Codable {
    /// ID of the attachment.
    public var id: String
    /// Type of the attachment.
    public var type: AttachmentType
    /// URL of the locally hosted version of the image.
    public var url: String
    /// For remote images, the remote URL of the original image.
    public var remoteURL: String?
    /// URL of the preview image.
    public var previewURL: URL
    /// Shorter URL for the image, for insertion into text (only present on local images).
    public var textURL: String?
    /// A description of the image for the visually impaired.
    public var description: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case remoteURL = "remote_url"
        case previewURL = "preview_url"
        case textURL = "text_url"
        case description
    }
}
