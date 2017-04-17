import Foundation

public enum AttachmentType {
    case image, video, gifv, unknown

    // MARK: - Private

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
