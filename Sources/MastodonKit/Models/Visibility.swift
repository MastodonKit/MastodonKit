//
//  Visibility.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum Visibility: String, Codable {
    /// The status message is public.
    /// - Visible on Profile: Anyone incl. anonymous viewers.
    /// - Visible on Public Timeline: Yes.
    /// - Federates to other instances: Yes.
    case `public`
    /// The status message is unlisted.
    /// - Visible on Profile: Anyone incl. anonymous viewers.
    /// - Visible on Public Timeline: No.
    /// - Federates to other instances: Yes.
    case unlisted
    /// The status message is private.
    /// - Visible on Profile: Followers only.
    /// - Visible on Public Timeline: No.
    /// - Federates to other instances: Only remote @mentions.
    case `private`
    /// The status message is direct.
    /// - Visible on Profile: No.
    /// - Visible on Public Timeline: No.
    /// - Federates to other instances: Only remote @mentions.
    case direct
}
