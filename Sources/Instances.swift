import Foundation

public struct Instances {
    public static func current() -> InstanceResource {
        return InstanceResource(path: "/api/v1/instance", parameters: nil, parse: InstanceResource.parser)
    }
}
