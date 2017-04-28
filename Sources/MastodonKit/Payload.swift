import Foundation

enum Payload {
    case parameters(Parameters?)
    case image(Data?)
    case empty
}

extension Payload {
    var items: [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters.flatMap(toQueryItems)
        case .image: return nil
        case .empty: return nil
        }
    }

    var data: Data? {
        switch self {
        case .parameters(let parameters): return parameters.flatMap(toData)
        case .image(let data): return data
        case .empty: return nil
        }
    }
}
