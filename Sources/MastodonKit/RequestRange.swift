import Foundation

public enum RequestRange {
    /// Gets a list with IDs less than or equal this value.
    case max(id: Int, limit: Int?)
    /// Gets a list with IDs greater than this value.
    case since(id: Int, limit: Int?)
    /// Sets the maximum number of entities to get.
    case limit(Int)
    /// Applies the default values.
    case `default`
}

extension RequestRange {
    func parameters(limit f: (Int) -> Int) -> [Parameter]? {
        switch self {
        case .max(let id, let limit):
            return [
                Parameter(name: "max_id", value: String(id)),
                Parameter(name: "limit", value: limit.flatMap(f).flatMap(toOptionalString))
            ]
        case .since(let id, let limit):
            return [
                Parameter(name: "since_id", value: String(id)),
                Parameter(name: "limit", value: limit.flatMap(f).flatMap(toOptionalString))
            ]
        case .limit(let limit):
            return [Parameter(name: "limit", value: String(f(limit)))]
        default:
            return nil
        }
    }
}
