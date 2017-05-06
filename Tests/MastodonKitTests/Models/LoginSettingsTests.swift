import XCTest
@testable import MastodonKit

class LoginSettingsTests: XCTestCase {
    func testLoginSettingsFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let dictionary = fixture as! JSONDictionary
        let loginSettings = LoginSettings(from: dictionary)!

        XCTAssertEqual(loginSettings.accessToken, "the secret code is yellow")
        XCTAssertEqual(loginSettings.accessTokenType, "bär")
        XCTAssertEqual(loginSettings.scopes, [.read, .write])
        XCTAssertEqual(loginSettings.createdAt, 1492249031)
    }
}
