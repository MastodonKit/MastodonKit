//
//  Mention.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Mention {
    /// Account ID.
    public let id: Int
    /// The username of the account.
    public let username: String
    /// Equals username for local users, includes @domain for remote ones.
    public let acct: String
    /// URL of user's profile (can be remote).
    public let url: String
}

extension Mention: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? Int,
            let username = dictionary["username"] as? String,
            let acct = dictionary["acct"] as? String,
            let url = dictionary["url"] as? String
            else {
                return nil
        }

        self.id = id
        self.username = username
        self.acct = acct
        self.url = url
    }
}
