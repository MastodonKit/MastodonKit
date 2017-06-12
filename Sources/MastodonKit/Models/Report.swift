//
//  Report.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Report {
    /// The ID of the report.
    public let id: Int
    /// The action taken in response to the report.
    public let actionTaken: String
}

extension Report: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? Int,
            let actionTaken = dictionary["action_taken"] as? String
            else {
                return nil
        }

        self.id = id
        self.actionTaken = actionTaken
    }
}
