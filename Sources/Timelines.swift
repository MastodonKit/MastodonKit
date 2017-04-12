import Foundation

public struct Timelines {
    /// Retrieves the home timeline.
    ///
    /// - Returns: Resource for retrieving the home timeline.
    public static func home() -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/home", parameters: nil, parse: TimelineResource.parser)
    }

    /// Retrieves the public timeline.
    ///
    /// - Returns: Resource for retrieving the public timeline.
    public static func `public`() -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/public", parameters: nil, parse: TimelineResource.parser)
    }

    /// Retrieves a tag timeline.
    ///
    /// - Parameter hashtag: The hashtag.
    /// - Returns: Resource for retrieving a tag/hashtag timeline.
    public static func tag(_ hashtag: String) -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/tag/\(hashtag)", parameters: nil, parse: TimelineResource.parser)
    }
}
