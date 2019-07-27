//
//  Poll.swift
//  MastodonKit
//
//  Created by Daniel Nitsikopoulos on 26/7/19.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Poll: Codable {
    /// The ID of the status.
    public let id: String
    /// When the poll will expire.
    public let expiresAt: Date
    /// Whether the poll has expired.
    public let expired: Bool
    /// Whether this is a multi poll.
    public let multiple: Bool
    /// Number of votes (total).
    public let votesCount: Int
    /// Whether the current user voted.
    public let voted: Bool
    /// An array of poll options.
    public let options: [Option]
    /// An array of Emoji.
    public let emojis: [Emoji]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case expiresAt = "expires_at"
        case expired
        case multiple
        case votesCount = "votes_count"
        case voted
        case options
        case emojis
    }
}
