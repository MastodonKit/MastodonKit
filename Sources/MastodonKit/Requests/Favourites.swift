import Foundation

public struct Favourites {
    /// Fetches a user's favourites.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func all(range: RequestRange = .default) -> TimelineRequest {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return TimelineRequest(path: "/api/v1/favourites", method: method, parse: TimelineRequest.parser)
    }
}
