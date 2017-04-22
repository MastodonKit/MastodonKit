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
}

extension Status {
    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let uri = json["uri"] as? String,
            let urlString = json["url"] as? String,
            let url = URL(string: urlString),
            let accountDictionary = json["account"] as? JSONDictionary,
            let account = Account(json: accountDictionary),
            let content = json["content"] as? String,
            let createdAtString = json["created_at"] as? String,
            let createdAt = DateFormatter.mastodonFormatter.date(from: createdAtString),
            let reblogsCount = json["reblogs_count"] as? Int,
            let favouritesCount = json["favourites_count"] as? Int,
            let spoilerText = json["spoiler_text"] as? String,
            let visibilityString = json["visibility"] as? String,
            let attachmentsArray = json["media_attachments"] as? [JSONDictionary],
            let mentionsArray = json["mentions"] as? [JSONDictionary],
            let tagsArray = json["tags"] as? [JSONDictionary]
            else {
                return nil
        }

        self.id = id
        self.uri = uri
        self.url = url
        self.account = account
        self.inReplyToID = json["in_reply_to_id"] as? Int
        self.inReplyToAccountID = json["in_reply_to_account_id"] as? Int
        self.content = content
        self.createdAt = createdAt
        self.reblogsCount = reblogsCount
        self.favouritesCount = favouritesCount
        self.reblogged = json["reblogged"] as? Bool
        self.favourited = json["favourited"] as? Bool
        self.sensitive = json["sensitive"] as? Bool
        self.spoilerText = spoilerText
        self.visibility = Visibility(string: visibilityString)
        self.application = json["application"].flatMap(toJSONDictionary).flatMap(Application.init)
        self.mediaAttachments = attachmentsArray.flatMap(Attachment.init)
        self.mentions = mentionsArray.flatMap(Mention.init)
        self.tags = tagsArray.flatMap(Tag.init)
    }
}
