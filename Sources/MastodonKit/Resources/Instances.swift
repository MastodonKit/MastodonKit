import Foundation

public struct Instances {
    /// Gets instance information.
    ///
    /// - Returns: Resource for `Instance`.
    public static func current() -> InstanceResource {
        return InstanceResource(path: "/api/v1/instance", parse: InstanceResource.parser)
    }
}
