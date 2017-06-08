//
//  AttachmentType.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum AttachmentType: String {
    /// The attachment contains a static image.
    case image
    /// The attachment contains a video.
    case video
    /// The attachment contains a gif image.
    case gifv
}
