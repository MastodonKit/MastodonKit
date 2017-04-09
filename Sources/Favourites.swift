import Foundation

public struct Favourites {
    public static func all() -> TimelineResource {
        return TimelineResource(path: "/api/v1/favourites", parameters: nil, parse: TimelineResource.parser)
    }
}
