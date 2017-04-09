import Foundation

public enum VisibilityType {
    case `public`, unlisted, `private`, direct
}

public struct Status {
    public let id: Int
    public let uri: String
    public let url: URL
    public let account: Account
    public let inReplyToID: Int?
    public let inReplyToAccountID: Int?
    public let content: String
    public let reblogsCount: Int
    public let favouritesCount: Int
    public let reblogged: Bool?
    public let favourited: Bool?
    public let sensitive: Bool?
    public let spoilerText: String
    public let visibility: VisibilityType
    public let mediaAttachments: [Attachment]
    public let mentions: [Mention]
    public let tags: [Tag]
    public let application: Application?
}

extension VisibilityType {
    init(string: String) {
        switch string {
        case "public":
            self = .public
        case "unlisted":
            self = .unlisted
        case "private":
            self = .private
        case "direct":
            self = .direct
        default:
            self = .unlisted
        }
    }
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
        self.reblogsCount = reblogsCount
        self.favouritesCount = favouritesCount
        self.reblogged = json["reblogged"] as? Bool
        self.favourited = json["favourited"] as? Bool
        self.sensitive = json["sensitive"] as? Bool
        self.spoilerText = spoilerText
        self.visibility = VisibilityType(string: visibilityString)

        let applicationDictionary = json["application"] as? JSONDictionary
        self.application = applicationDictionary != nil ? Application(json: applicationDictionary!) : nil

        self.mediaAttachments = attachmentsArray.flatMap(Attachment.init)
        self.mentions = mentionsArray.flatMap(Mention.init)
        self.tags = tagsArray.flatMap(Tag.init)
    }
}
