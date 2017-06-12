//
//  Application.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Application {
    /// Name of the app.
    public let name: String
    /// Homepage URL of the app.
    public let website: String?
}

extension Application: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let name = dictionary["name"] as? String
            else {
                return nil
        }

        self.name = name
        self.website = dictionary["website"] as? String
    }
}
