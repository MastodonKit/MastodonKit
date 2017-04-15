import Foundation

typealias JSONDictionary = [String: Any]

enum HTTPMethod {
    case get, post, delete, patch

    func toString() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .patch:
            return "PATCH"
        }
    }
}
