//
//  Poll.swift
//  MastodonKit
//
//  Created by Daniel Nitsikopoulos on 26/7/19.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

extension Poll {
    public struct Option: Codable {
        public let title: String
        public let votesCount: Int
        
        private enum CodingKeys: String, CodingKey {
            /// The title of the poll option.
            case title
            /// The number of votes for this option.
            case votesCount = "votes_count"
        }
    }
}
