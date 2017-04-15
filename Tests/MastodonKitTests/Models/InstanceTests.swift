import XCTest
@testable import MastodonKit

class InstanceTests: XCTestCase {
    static var allTests = [
        ("testInstanceFromJSON", testInstanceFromJSON)
    ]

    var instanceFixture: Any!

    override func setUp() {
        super.setUp()
        instanceFixture = try? Fixture.load(fileName: "Fixtures/Instance.json")
    }

    func testInstanceFromJSON() {
        let dictionary = instanceFixture as! JSONDictionary
        let instance = Instance(json: dictionary)

        XCTAssertEqual(instance?.uri, "instance's uri")
        XCTAssertEqual(instance?.title, "nice title")
        XCTAssertEqual(instance?.description,"sweet description")
        XCTAssertEqual(instance?.email, "wunderbar email")
    }
}
