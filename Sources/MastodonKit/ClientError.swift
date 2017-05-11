import Foundation

public enum ClientError: Error {
    /// Failed to build the URL to make the request.
    case malformedURL
    /// The Mastodon service returned an error.
    case mastodonError(String)
    /// Failed to parse the response from Mastodon.
    case dataError
}
