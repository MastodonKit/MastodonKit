import Foundation

enum HTTPMethod {
    case get(Payload)
    case post(Payload)
    case delete

    var name: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .delete: return "DELETE"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .get(let payload): return payload.items
        default: return nil
        }
    }

    var httpBody: Data? {
        switch self {
        case .post(let payload): return payload.data
        default: return nil
        }
    }
}
