import XCTest
@testable import MastodonKit

class FollowRequestsTests: XCTestCase {
    func testAll() {
        let resource = FollowRequests.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/follow_requests")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testAuthorize() {
        let resource = FollowRequests.authorize(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/follow_requests/42/authorize")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testReject() {
        let resource = FollowRequests.reject(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/follow_requests/42/reject")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }
}
