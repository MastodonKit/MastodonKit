import Foundation

public enum RequestError: Error {
    case apiError(reason: String?)
}

extension RequestError {
    init(json: JSONDictionary) {
        if let description = json["error"] as? String {
            self = .apiError(reason: description)
        } else {
            self = .apiError(reason: nil)
        }
    }
}
