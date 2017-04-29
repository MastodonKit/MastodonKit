import XCTest
@testable import MastodonKit

class InstancesTests: XCTestCase {
    func testCurrent() {
        let resource = Instances.current()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/instance")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Instance?>.self)
    }
}
