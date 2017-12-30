//
//  Media.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Media {
    /// Uploads a media attachment.
    ///
    /// - Parameter mediaAttachment: The media attachment to upload.
    /// - Returns: Request for `Attachment`.
    public static func upload(media mediaAttachment: MediaAttachment) -> Request<Attachment> {
        let method = HTTPMethod.post(.media(mediaAttachment))
        return Request<Attachment>(path: "/api/v1/media", method: method)
    }
}
