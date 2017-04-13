import Foundation

public struct Favourites {
    /// Fetches a user's favourites.
    ///
    /// - Returns: Resource for `[Status]`.
    public static func all() -> TimelineResource {
        return TimelineResource(path: "/api/v1/favourites", parse: TimelineResource.parser)
    }
}
