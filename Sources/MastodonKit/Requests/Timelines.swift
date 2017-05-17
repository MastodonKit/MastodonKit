import Foundation

public struct Timelines {
    /// Retrieves the home timeline.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func home(range: RequestRange = .default) -> TimelineRequest {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return TimelineRequest(path: "/api/v1/timelines/home", method: method, parse: TimelineRequest.parser)
    }

    /// Retrieves the public timeline.
    ///
    /// - Parameters:
    ///   - local: Only return statuses originating from this instance.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func `public`(local: Bool? = nil, range: RequestRange = .default) -> TimelineRequest {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20)) ?? []
        let localParameters = [Parameter(name: "local", value: local.flatMap(trueOrNil))]
        let method = HTTPMethod.get(Payload.parameters(localParameters + rangeParameters))

        return TimelineRequest(path: "/api/v1/timelines/public", method: method, parse: TimelineRequest.parser)
    }

    /// Retrieves a tag timeline.
    ///
    /// - Parameters:
    ///   - hashtag: The hashtag.
    ///   - local: Only return statuses originating from this instance.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func tag(_ hashtag: String, local: Bool? = nil, range: RequestRange = .default) -> TimelineRequest {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20)) ?? []
        let localParameters = [Parameter(name: "local", value: local.flatMap(trueOrNil))]
        let method = HTTPMethod.get(Payload.parameters(localParameters + rangeParameters))

        return TimelineRequest(path: "/api/v1/timelines/tag/\(hashtag)", method: method, parse: TimelineRequest.parser)
    }
}
