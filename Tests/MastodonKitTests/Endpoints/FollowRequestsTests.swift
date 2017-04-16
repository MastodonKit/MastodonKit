import XCTest
@testable import MastodonKit

class FollowRequestsTests: XCTestCase {
    static var allTests = [
        ("testAll", testAll),
        ("testAuthorize", testAuthorize),
        ("testReject", testReject)
    ]

    func testAll() {
        let resource = FollowRequests.all()

        XCTAssertEqual(resource.path, "/api/v1/follow_requests")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]>.self)
    }

    func testAuthorize() {
        let resource = FollowRequests.authorize(id: 42)

        let expectedID = URLQueryItem(name: "id", value: "42")

        XCTAssertEqual(resource.path, "/api/v1/follow_requests/authorize")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 1)
        XCTAssertTrue(resource.parameters!.contains(expectedID))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testReject() {
        let resource = FollowRequests.reject(id: 42)

        let expectedID = URLQueryItem(name: "id", value: "42")

        XCTAssertEqual(resource.path, "/api/v1/follow_requests/reject")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 1)
        XCTAssertTrue(resource.parameters!.contains(expectedID))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }
}
