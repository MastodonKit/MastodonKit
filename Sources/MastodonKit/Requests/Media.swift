import Foundation

public struct Media {
    /// Uploads a media attachment.
    ///
    /// - Parameter mediaAttachment: The media attachment to upload.
    /// - Returns: Request for `Attachment`.
    public static func upload(media mediaAttachment: MediaAttachment) -> AttachmentRequest {
        let method = HTTPMethod.post(.media(mediaAttachment))
        return AttachmentRequest(path: "/api/v1/media", method: method, parse: AttachmentRequest.parser)
    }
}
