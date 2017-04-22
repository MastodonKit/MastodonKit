import Foundation

public struct Timelines {
    /// Retrieves the home timeline.
    ///
    /// - Returns: Resource for `[Status]`.
    public static func home() -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/home", parse: TimelineResource.parser)
    }

    /// Retrieves the public timeline.
    ///
    /// - Returns: Resource for `[Status]`.
    public static func `public`() -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/public", parse: TimelineResource.parser)
    }

    /// Retrieves a tag timeline.
    ///
    /// - Parameter hashtag: The hashtag.
    /// - Returns: Resource for `[Status]`.
    public static func tag(_ hashtag: String) -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/tag/\(hashtag)", parse: TimelineResource.parser)
    }
}
