import Foundation

public struct Timelines {
    /// Retrieves the home timeline.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Status]`.
    public static func home(range: ResourceRange = .default) -> TimelineResource {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return TimelineResource(path: "/api/v1/timelines/home", method: method, parse: TimelineResource.parser)
    }

    /// Retrieves the public timeline.
    ///
    /// - Parameters:
    ///   - local: Only return statuses originating from this instance.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Status]`.
    public static func `public`(local: Bool? = nil, range: ResourceRange = .default) -> TimelineResource {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20)) ?? []
        let localParameters = [Parameter(name: "local", value: local.flatMap(nilOrTrue))]
        let method = HTTPMethod.get(Payload.parameters(localParameters + rangeParameters))

        return TimelineResource(path: "/api/v1/timelines/public", method: method, parse: TimelineResource.parser)
    }

    /// Retrieves a tag timeline.
    ///
    /// - Parameters:
    ///   - hashtag: The hashtag.
    ///   - local: Only return statuses originating from this instance.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Resource for `[Status]`.
    public static func tag(_ hashtag: String, local: Bool? = nil, range: ResourceRange = .default) -> TimelineResource {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20)) ?? []
        let localParameters = [Parameter(name: "local", value: local.flatMap(nilOrTrue))]
        let method = HTTPMethod.get(Payload.parameters(localParameters + rangeParameters))

        return TimelineResource(path: "/api/v1/timelines/tag/\(hashtag)", method: method, parse: TimelineResource.parser)
    }
}
