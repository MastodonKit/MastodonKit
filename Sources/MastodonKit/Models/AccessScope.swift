import Foundation

public enum AccessScope {
    case read, write, follow

    var stringValue: String {
        switch self {
        case .read:
            return "read"
        case .write:
            return "write"
        case .follow:
            return "follow"
        }
    }
}
