import Foundation

public enum Visibility: String {
    case `public`
    case unlisted
    case `private`
    case direct
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
