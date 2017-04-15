import XCTest
@testable import MastodonKit

class ApplicationTests: XCTestCase {
    static var allTests = [
        ("testApplicationFromJSON", testApplicationFromJSON)
    ]

    var applicationFixture: Any!

    override func setUp() {
        super.setUp()
        applicationFixture = try? Fixture.load(fileName: "Fixtures/Application.json")
    }

    func testApplicationFromJSON() {
        let dictionary = applicationFixture as! JSONDictionary
        let application = Application(json: dictionary)

        XCTAssertEqual(application?.name, "MastodonKitTestClient")
        XCTAssertEqual(application?.website, "https://github.com/ornithocoder/MastodonKit")
    }
}
