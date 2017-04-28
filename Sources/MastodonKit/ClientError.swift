import Foundation

public enum ClientError: Error {
    case malformedURL
    case mastodonError(String)
    case dataError
}
