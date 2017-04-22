import Foundation

public enum ClientError: Error {
    case mastodonError(String)
    case dataError
}
