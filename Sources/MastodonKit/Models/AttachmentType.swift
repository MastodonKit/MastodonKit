import Foundation

public enum AttachmentType {
    /// The attachment contains a static image.
    case image
    /// The attachment contains a video.
    case video
    /// The attachment contains a gif image.
    case gifv
    /// The attachment contains an unknown media type.
    case unknown
}

extension AttachmentType {
    init(string: String) {
        switch string {
        case "image": self = .image
        case "video": self = .video
        case "gifv": self = .gifv
        default: self = .unknown
        }
    }
}
