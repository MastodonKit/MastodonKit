import XCTest
@testable import MastodonKit

class LoginTests: XCTestCase {
    static var allTests = [
        ("testSilentLogin", testSilentLogin)
    ]

    func testSilentLogin() {
        let resource = Login.silent(clientID: "client id", clientSecret: "client secret", scope: .read, username: "foo", password: "123")

        let expectedClientID = URLQueryItem(name: "client_id", value: "client id")
        let expectedClientSecret = URLQueryItem(name: "client_secret", value: "client secret")
        let expectedScope = URLQueryItem(name: "scope", value: "read")
        let expectedGrantType = URLQueryItem(name: "grant_type", value: "password")
        let expectedUsername = URLQueryItem(name: "username", value: "foo")
        let expectedPassword = URLQueryItem(name: "password", value: "123")

        XCTAssertEqual(resource.path, "/oauth/token")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters!.count, 6)
        XCTAssertTrue(resource.parameters!.contains(expectedClientID))
        XCTAssertTrue(resource.parameters!.contains(expectedClientSecret))
        XCTAssertTrue(resource.parameters!.contains(expectedScope))
        XCTAssertTrue(resource.parameters!.contains(expectedGrantType))
        XCTAssertTrue(resource.parameters!.contains(expectedUsername))
        XCTAssertTrue(resource.parameters!.contains(expectedPassword))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<LoginSettings?>.self)
    }
}
