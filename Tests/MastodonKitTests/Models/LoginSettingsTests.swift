import XCTest
@testable import MastodonKit

class LoginSettingsTests: XCTestCase {
    static var allTests = [
        ("testLoginSettingsFromJSON", testLoginSettingsFromJSON)
    ]

    func testLoginSettingsFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let dictionary = fixture as! JSONDictionary
        let loginSettings = LoginSettings(json: dictionary)

        XCTAssertEqual(loginSettings?.accessToken, "the secret code is yellow")
        XCTAssertEqual(loginSettings?.accessTokenType, "bär")
        XCTAssertEqual(loginSettings?.scope, AccessScope.follow)
        XCTAssertEqual(loginSettings?.createdAt, 1492249031)
    }
}
