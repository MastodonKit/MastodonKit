import Foundation

enum Payload {
    case parameters([Parameter]?)
    case image(Data?)
    case empty
}

extension Payload {
    var items: [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toQueryItem)
        case .image: return nil
        case .empty: return nil
        }
    }

    var data: Data? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toString).joined(separator: "&").data(using: .utf8)
        case .image(let data): return data
        case .empty: return nil
        }
    }
}
