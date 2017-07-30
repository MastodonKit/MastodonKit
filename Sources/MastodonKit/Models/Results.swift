//
//  Results.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/19/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Results {
    /// An array of matched accounts.
    public let accounts: [Account]
    /// An array of matchhed statuses.
    public let statuses: [Status]
    /// An array of matched hashtags, as strings.
    public let hashtags: [String]
}

extension Results: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let accountsArray = dictionary["accounts"] as? [JSONDictionary],
            let statusesArray = dictionary["statuses"] as? [JSONDictionary],
            let hashtagsArray = dictionary["hashtags"] as? [String]
            else {
                return nil
        }

        self.accounts = accountsArray.flatMap(Account.init)
        self.statuses = statusesArray.flatMap(Status.init)
        self.hashtags = hashtagsArray
    }
}
