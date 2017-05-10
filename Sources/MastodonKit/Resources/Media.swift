import Foundation

public struct Media {
    /// Uploads a media attachment.
    ///
    /// - Parameter mediaAttachment: The media attachment to upload.
    /// - Returns: Resource for `Attachment`.
    public static func upload(media mediaAttachment: MediaAttachment) -> AttachmentResource {
        let method = HTTPMethod.post(.media(mediaAttachment))
        return AttachmentResource(path: "/api/v1/media", method: method, parse: AttachmentResource.parser)
    }
}
