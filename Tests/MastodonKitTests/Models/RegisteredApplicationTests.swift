import XCTest
@testable import MastodonKit

class RegisteredApplicationTests: XCTestCase {
    func testRegisteredApplicationFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/RegisteredApplication.json")
        let dictionary = fixture as! JSONDictionary
        let application = RegisteredApplication(json: dictionary)

        XCTAssertEqual(application?.id, 42)
        XCTAssertEqual(application?.redirectURI, "urn:ietf:wg:oauth:2.0:oob")
        XCTAssertEqual(application?.clientID, "very_long_client_id")
        XCTAssertEqual(application?.clientSecret, "very_long_client_secret")
    }
}
