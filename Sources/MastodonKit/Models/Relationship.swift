//
//  Relationship.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Relationship: Codable {
    /// Target account id.
    public let id: String
    /// Whether the user is currently following the account.
    public let following: Bool
    /// Whether the user is currently being followed by the account.
    public let followedBy: Bool
    /// Whether the user is currently blocking the account.
    public let blocking: Bool
    /// Whether the user is currently muting the account.
    public let muting: Bool
    /// Whether the user is also muting notifications
    public let mutingNotifications: Bool
    /// Whether the user has requested to follow the account.
    public let requested: Bool
    /// Whether the user is currently blocking the user's domain.
    public let domainBlocking: Bool

    private enum CodingKeys: String, CodingKey {
        case id
        case following
        case followedBy = "followed_by"
        case blocking
        case muting
        case mutingNotifications = "muting_notifications"
        case requested
        case domainBlocking = "domain_blocking"
    }
}
