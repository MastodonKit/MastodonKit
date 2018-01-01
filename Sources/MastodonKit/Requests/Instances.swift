//
//  Instances.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Instances {
    /// Gets instance information.
    ///
    /// - Returns: Request for `Instance`.
    public static func current() -> Request<Instance> {
        return Request<Instance>(path: "/api/v1/instance")
    }

    /// Fetches current instance's custom emojis.
    ///
    /// - Returns: Request for `[Emoji]`.
    public static func customEmojis() -> Request<[Emoji]> {
        return Request<[Emoji]>(path: "/api/v1/custom_emojis")
    }
}
