//
//  Account.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Account {
    /// The ID of the account.
    public let id: Int
    /// The username of the account.
    public let username: String
    /// Equals username for local users, includes @domain for remote ones.
    public let acct: String
    /// The account's display name.
    public let displayName: String
    /// Biography of user.
    public let note: String
    /// URL of the user's profile page (can be remote).
    public let url: String
    /// URL to the avatar image.
    public let avatar: String
    /// URL to the avatar static image
    public let avatarStatic: String
    /// URL to the header image.
    public let header: String
    /// URL to the header static image
    public let headerStatic: String
    /// Boolean for when the account cannot be followed without waiting for approval first.
    public let locked: Bool
    /// The time the account was created.
    public let createdAt: Date
    /// The number of followers for the account.
    public let followersCount: Int
    /// The number of accounts the given account is following.
    public let followingCount: Int
    /// The number of statuses the account has made.
    public let statusesCount: Int
}

extension Account: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? String,
            let intID = Int(id),
            let username = dictionary["username"] as? String,
            let acct = dictionary["acct"] as? String,
            let displayName = dictionary["display_name"] as? String,
            let locked = dictionary["locked"] as? Bool,
            let createdAtString = dictionary["created_at"] as? String,
            let createdAt = DateFormatter.mastodonFormatter.date(from: createdAtString),
            let note = dictionary["note"] as? String,
            let url = dictionary["url"] as? String,
            let avatar = dictionary["avatar"] as? String,
            let avatarStatic = dictionary["avatar_static"] as? String,
            let header = dictionary["header"] as? String,
            let headerStatic = dictionary["header_static"] as? String,
            let followersCount = dictionary["followers_count"] as? Int,
            let followingCount = dictionary["following_count"] as? Int,
            let statusesCount = dictionary["statuses_count"] as? Int
            else {
                return nil
        }

        self.id = intID
        self.username = username
        self.acct = acct
        self.displayName = displayName
        self.note = note
        self.url = url
        self.avatar = avatar
        self.avatarStatic = avatarStatic
        self.header = header
        self.headerStatic = headerStatic
        self.locked = locked
        self.createdAt = createdAt
        self.followersCount = followersCount
        self.followingCount = followingCount
        self.statusesCount = statusesCount
    }
}
