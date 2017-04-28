import XCTest
@testable import MastodonKit

class InstancesTests: XCTestCase {
    func testCurrent() {
        let resource = Instances.current()

        XCTAssertEqual(resource.path, "/api/v1/instance")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Instance?>.self)
    }
}
