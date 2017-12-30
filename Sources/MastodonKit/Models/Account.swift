//
//  Account.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Account: Codable {
    /// The ID of the account.
    public let id: String
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

    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case acct
        case displayName = "display_name"
        case note
        case url
        case avatar
        case avatarStatic = "avatar_static"
        case header
        case headerStatic = "header_static"
        case locked
        case createdAt = "created_at"
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case statusesCount = "statuses_count"
    }
}
