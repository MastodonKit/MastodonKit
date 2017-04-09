import Foundation

public struct Relationship {
    public let following: Bool
    public let followedBy: Bool
    public let blocking: Bool
    public let muting: Bool
    public let requested: Bool
}
