//
//  RequestError.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

struct MastodonError {
    /// Reason why Mastodon returned an error.
    let description: String
}

extension MastodonError {
    init(json: JSONObject) {
        let dictionary = json as? JSONDictionary
        self.description = dictionary?["error"].flatMap(asString) ?? ""
    }
}
