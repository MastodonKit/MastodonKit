import Foundation

public enum AttachmentType {
    case image, video, gifv, unknown
}

public struct Attachment {
    public let id: Int
    public let type: AttachmentType
    public let url: String
    public let remoteURL: String
    public let previewURL: String
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
            let remoteURL = json["remote_url"] as? String,
            let previewURL = json["preview_url"] as? String,
            let textURL = json["text_url"] as? String
            else {
                return nil
        }

        self.id = id
        self.type = AttachmentType(string: typeString)
        self.url = url
        self.remoteURL = remoteURL
        self.previewURL = previewURL
        self.textURL = textURL
    }
}
