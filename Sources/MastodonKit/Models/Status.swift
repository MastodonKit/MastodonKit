import Foundation

/// Visibility type.
///
/// - public: Visible to any other user on the public timelines.
/// - unlisted: Public, except that they do not appear in the public timelines or search results.
/// - private: Do not appear in the public timeline nor on your profile page to anyone viewing it unless they are on your Followers list.
/// - direct: Are only visible to users you have @mentioned in them.
public enum VisibilityType {
    case `public`, unlisted, `private`, direct
}

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

    /// The visibility type of the status.
    public let visibility: VisibilityType

    /// An array of attachments.
    public let mediaAttachments: [Attachment]

    /// An array of mentions.
    public let mentions: [Mention]

    /// An array of tags.
    public let tags: [Tag]

    /// Application from which the status was posted.
    public let application: Application?
}

extension VisibilityType {
    var stringValue: String {
        switch self {
        case .public:
            return "public"
        case .unlisted:
            return "unlisted"
        case .private:
            return "private"
        case .direct:
            return "direct"
        }
    }

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
