import Foundation

public enum Visibility: String {
    case `public` = "public"
    case unlisted = "unlisted"
    case `private` = "private"
    case direct = "direct"
}

extension Visibility {
    init(string: String) {
        switch string {
        case "public": self = .public
        case "unlisted": self = .unlisted
        case "private": self = .private
        case "direct": self = .direct
        default: self = .unlisted
        }
    }
}
