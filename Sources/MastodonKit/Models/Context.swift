//
//  Context.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Context {
    /// The ancestors of the status in the conversation, as a list of statuses.
    public let ancestors: [Status]
    /// The descendants of the status in the conversation, as a list of statuses.
    public let descendants: [Status]
}

extension Context: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let ancestorsArray = dictionary["ancestors"] as? [JSONDictionary],
            let descendantsArray = dictionary["descendants"] as? [JSONDictionary]
            else {
                return nil
        }

        self.ancestors = ancestorsArray.flatMap(Status.init)
        self.descendants = descendantsArray.flatMap(Status.init)
    }
}
