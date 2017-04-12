import Foundation

public struct Instances {
    /// Gets instance information.
    ///
    /// - Returns: Resource for getting instance information.
    public static func current() -> InstanceResource {
        return InstanceResource(path: "/api/v1/instance", parameters: nil, parse: InstanceResource.parser)
    }
}
