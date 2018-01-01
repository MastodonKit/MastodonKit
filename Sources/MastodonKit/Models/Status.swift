//
//  Status.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Status: Codable {
    /// The ID of the status.
    public let id: String
    /// A Fediverse-unique resource ID.
    public let uri: String
    /// URL to the status page (can be remote).
    public let url: URL?
    /// The Account which posted the status.
    public let account: Account
    /// null or the ID of the status it replies to.
    public let inReplyToID: String?
    /// null or the ID of the account it replies to.
    public let inReplyToAccountID: String?
    /// Body of the status; this will contain HTML (remote HTML already sanitized).
    public let content: String
    /// The time the status was created.
    public let createdAt: Date
    /// An array of Emoji.
    public let emojis: [Emoji]
    /// The number of reblogs for the status.
    public let reblogsCount: Int
    /// The number of favourites for the status.
    public let favouritesCount: Int
    /// Whether the authenticated user has reblogged the status.
    public let reblogged: Bool?
    /// Whether the authenticated user has favourited the status.
    public let favourited: Bool?
    /// Whether media attachments should be hidden by default.
    public let sensitive: Bool?
    /// If not empty, warning text that should be displayed before the actual content.
    public let spoilerText: String
    /// The visibility of the status.
    public let visibility: Visibility
    /// An array of attachments.
    public let mediaAttachments: [Attachment]
    /// An array of mentions.
    public let mentions: [Mention]
    /// An array of tags.
    public let tags: [Tag]
    /// Application from which the status was posted.
    public let application: Application?
    /// The detected language for the status.
    public let language: String?
    /// The reblogged Status
    public let reblog: Status?
    /// Whether this is the pinned status for the account that posted it.
    public let pinned: Bool?

    private enum CodingKeys: String, CodingKey {
        case id
        case uri
        case url
        case account
        case inReplyToID = "in_reply_to_id"
        case inReplyToAccountID = "in_reply_to_account_id"
        case content
        case createdAt = "created_at"
        case emojis
        case reblogsCount = "reblogs_count"
        case favouritesCount = "favourites_count"
        case reblogged
        case favourited
        case sensitive
        case spoilerText = "spoiler_text"
        case visibility
        case mediaAttachments = "media_attachments"
        case mentions
        case tags
        case application
        case language
        case reblog
        case pinned
    }
}
