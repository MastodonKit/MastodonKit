import Foundation

public struct Timelines {
    public static func home() -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/home", parameters: nil, parse: TimelineResource.parser)
    }

    public static func `public`() -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/public", parameters: nil, parse: TimelineResource.parser)
    }

    public static func tag(hashtag: String) -> TimelineResource {
        return TimelineResource(path: "/api/v1/timelines/tag/\(hashtag)", parameters: nil, parse: TimelineResource.parser)
    }
}
