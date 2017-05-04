import XCTest
@testable import MastodonKit

class LoginTests: XCTestCase {
    func testSilentLogin() {
        let resource = Login.silent(clientID: "client id", clientSecret: "client secret", scope: .read, username: "foo", password: "123")

        // Endpoint
        XCTAssertEqual(resource.path, "/oauth/token")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 6)
        XCTAssertTrue(payload.contains("client_id=client%20id"))
        XCTAssertTrue(payload.contains("client_secret=client%20secret"))
        XCTAssertTrue(payload.contains("scope=read"))
        XCTAssertTrue(payload.contains("grant_type=password"))
        XCTAssertTrue(payload.contains("username=foo"))
        XCTAssertTrue(payload.contains("password=123"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<LoginSettings?>.self)
    }
}
