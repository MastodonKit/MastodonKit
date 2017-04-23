import XCTest
@testable import MastodonKit

class InstanceTests: XCTestCase {
    func testInstanceFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Instance.json")
        let dictionary = fixture as! JSONDictionary
        let instance = Instance(from: dictionary)

        XCTAssertEqual(instance?.uri, "instance's uri")
        XCTAssertEqual(instance?.title, "nice title")
        XCTAssertEqual(instance?.description,"sweet description")
        XCTAssertEqual(instance?.email, "wunderbar email")
    }
}
