//
//  RequestError.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

class MastodonError: Codable {
    /// Reason why Mastodon returned an error.
    let description: String

    private enum CodingKeys: String, CodingKey {
        case description = "error"
    }
}
