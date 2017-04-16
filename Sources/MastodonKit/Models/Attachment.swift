import Foundation

/// Attachment type.
///
/// - image: Image file.
/// - video: Video file.
/// - gifv: Animated image file.
/// - unknown: Unknown media format.
public enum AttachmentType {
    case image, video, gifv, unknown
}

public struct Attachment {
    /// ID of the attachment.
    public let id: Int

    /// Type of the attachment.
    public let type: AttachmentType

    /// URL of the locally hosted version of the image.
    public let url: String

    /// For remote images, the remote URL of the original image.
    public let remoteURL: String?

    /// URL of the preview image.
    public let previewURL: String

    /// Shorter URL for the image, for insertion into text (only present on local images).
    public let textURL: String
}

extension AttachmentType {
    init(string: String) {
        switch string {
        case "image":
            self = .image
        case "video":
            self = .video
        case "gifv":
            self = .gifv
        default:
            self = .unknown
        }
    }
}

extension Attachment {
    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let typeString = json["type"] as? String,
            let url = json["url"] as? String,
            let previewURL = json["preview_url"] as? String,
            let textURL = json["text_url"] as? String
            else {
                return nil
        }

        self.id = id
        self.type = AttachmentType(string: typeString)
        self.url = url
        self.remoteURL = json["remote_url"] as? String
        self.previewURL = previewURL
        self.textURL = textURL
    }
}
