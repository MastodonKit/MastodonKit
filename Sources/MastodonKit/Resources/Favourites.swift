import Foundation

public struct Favourites {
    /// Fetches a user's favourites.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Status]`.
    public static func all(range: ResourceRange = .default) -> TimelineResource {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return TimelineResource(path: "/api/v1/favourites", method: method, parse: TimelineResource.parser)
    }
}
