//
//  Instance.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Instance {
    /// URI of the current instance.
    public let uri: String
    /// The instance's title.
    public let title: String
    /// A description for the instance.
    public let description: String
    /// An email address which can be used to contact the instance administrator.
    public let email: String
    /// The Mastodon version used by instance (as of version 1.3).
    public let version: String?
}

extension Instance: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let uri = dictionary["uri"] as? String,
            let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String,
            let email = dictionary["email"] as? String
            else {
                return nil
        }

        self.uri = uri
        self.title = title
        self.description = description
        self.email = email
        self.version = dictionary["version"] as? String
    }
}
