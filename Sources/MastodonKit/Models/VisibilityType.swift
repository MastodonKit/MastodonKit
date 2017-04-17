import Foundation

public enum VisibilityType {
    case `public`, unlisted, `private`, direct

    // MARK: - Private

    var stringValue: String {
        switch self {
        case .public:
            return "public"
        case .unlisted:
            return "unlisted"
        case .private:
            return "private"
        case .direct:
            return "direct"
        }
    }

    init(string: String) {
        switch string {
        case "public":
            self = .public
        case "unlisted":
            self = .unlisted
        case "private":
            self = .private
        case "direct":
            self = .direct
        default:
            self = .unlisted
        }
    }
}
