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
    /// - Parameter local: Only return statuses originating from this instance.
    /// - Returns: Resource for `[Status]`.
    public static func `public`(local: Bool? = nil) -> TimelineResource {
        let parameters = [
            Parameter(name: "local", value: local.flatMap(nilOrTrue))
        ]

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return TimelineResource(path: "/api/v1/timelines/public", method: method, parse: TimelineResource.parser)
    }

    /// Retrieves a tag timeline.
    ///
    /// - Parameters:
    ///   - hashtag: The hashtag.
    ///   - local: Only return statuses originating from this instance.
    /// - Returns: Resource for `[Status]`.
    public static func tag(_ hashtag: String, local: Bool? = nil) -> TimelineResource {
        let parameters = [
            Parameter(name: "local", value: local.flatMap(nilOrTrue))
        ]

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return TimelineResource(path: "/api/v1/timelines/tag/\(hashtag)", method: method, parse: TimelineResource.parser)
    }
}
