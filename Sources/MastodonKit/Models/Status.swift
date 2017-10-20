//
//  Status.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Status {
    /// The ID of the status.
    public let id: Int
    /// A Fediverse-unique resource ID.
    public let uri: String
    /// URL to the status page (can be remote).
    public let url: URL
    /// The Account which posted the status.
    public let account: Account
    /// null or the ID of the status it replies to.
    public let inReplyToID: Int?
    /// null or the ID of the account it replies to.
    public let inReplyToAccountID: Int?
    /// Body of the status; this will contain HTML (remote HTML already sanitized).
    public let content: String
    /// The time the status was created.
    public let createdAt: Date
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
    public var reblog: Status? {
        return reblogWrapper.first?.flatMap { $0 }
    }

    var reblogWrapper: [Status?]
}

extension Status: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? String,
            let intID = Int(id),
            let uri = dictionary["uri"] as? String,
            let urlString = dictionary["url"] as? String,
            let url = URL(string: urlString),
            let accountDictionary = dictionary["account"] as? JSONDictionary,
            let account = Account(from: accountDictionary),
            let content = dictionary["content"] as? String,
            let createdAtString = dictionary["created_at"] as? String,
            let createdAt = DateFormatter.mastodonFormatter.date(from: createdAtString),
            let reblogsCount = dictionary["reblogs_count"] as? Int,
            let favouritesCount = dictionary["favourites_count"] as? Int,
            let spoilerText = dictionary["spoiler_text"] as? String,
            let visibilityString = dictionary["visibility"] as? String,
            let visibility = Visibility(rawValue: visibilityString),
            let attachmentsArray = dictionary["media_attachments"] as? [JSONDictionary],
            let mentionsArray = dictionary["mentions"] as? [JSONDictionary],
            let tagsArray = dictionary["tags"] as? [JSONDictionary]
            else {
                return nil
        }

        self.id = intID
        self.uri = uri
        self.url = url
        self.account = account
        self.inReplyToID = dictionary["in_reply_to_id"] as? Int
        self.inReplyToAccountID = dictionary["in_reply_to_account_id"] as? Int
        self.content = content
        self.createdAt = createdAt
        self.reblogsCount = reblogsCount
        self.favouritesCount = favouritesCount
        self.reblogged = dictionary["reblogged"] as? Bool
        self.favourited = dictionary["favourited"] as? Bool
        self.sensitive = dictionary["sensitive"] as? Bool
        self.spoilerText = spoilerText
        self.visibility = visibility
        self.reblogWrapper = [dictionary["reblog"].flatMap(asJSONDictionary).flatMap(Status.init)]
        self.application = dictionary["application"].flatMap(asJSONDictionary).flatMap(Application.init)
        self.mediaAttachments = attachmentsArray.flatMap(Attachment.init)
        self.mentions = mentionsArray.flatMap(Mention.init)
        self.tags = tagsArray.flatMap(Tag.init)
        self.language = dictionary["language"] as? String
    }
}
