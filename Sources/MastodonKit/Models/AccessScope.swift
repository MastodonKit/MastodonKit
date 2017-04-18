import Foundation

public enum AccessScope {
    case read, write, follow

    // MARK: - Private

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

    init(string: String) {
        switch string {
        case "read":
            self = .read
        case "write":
            self = .write
        case "follow":
            self = .follow
        default:
            self = .read
        }
    }
}
