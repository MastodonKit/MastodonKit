import XCTest
@testable import MastodonKit

class ApplicationTests: XCTestCase {
    func testApplicationFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Application.json")
        let dictionary = fixture as! JSONDictionary
        let application = Application(json: dictionary)

        XCTAssertEqual(application?.name, "MastodonKitTestClient")
        XCTAssertEqual(application?.website, "https://github.com/ornithocoder/MastodonKit")
    }

    func testApplicationWithInvalidData() {
        let application = Application(json: [:])

        XCTAssertNil(application)
    }
}
