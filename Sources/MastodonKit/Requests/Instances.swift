import Foundation

public struct Instances {
    /// Gets instance information.
    ///
    /// - Returns: Request for `Instance`.
    public static func current() -> InstanceRequest {
        return InstanceRequest(path: "/api/v1/instance", parse: InstanceRequest.parser)
    }
}
