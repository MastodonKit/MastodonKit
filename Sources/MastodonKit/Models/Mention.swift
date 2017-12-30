//
//  Mention.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Mention: Codable {
    /// Account ID.
    public let id: String
    /// The username of the account.
    public let username: String
    /// Equals username for local users, includes @domain for remote ones.
    public let acct: String
    /// URL of user's profile (can be remote).
    public let url: String
}
