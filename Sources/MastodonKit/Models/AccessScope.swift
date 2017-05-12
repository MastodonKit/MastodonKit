import Foundation

public enum AccessScope: String {
    /// Allows reading data.
    case read
    /// Allows posting statuses and uploading media for statuses.
    case write
    /// Allows following, unfollowing, blocking, and unblocking users.
    case follow
}

extension AccessScope {
    init(string: String) {
        switch string {
        case "read": self = .read
        case "write": self = .write
        case "follow": self = .follow
        default: self = .read
        }
    }
}
