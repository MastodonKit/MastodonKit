import XCTest
@testable import MastodonKit

class ContextTests: XCTestCase {
    static var allTests = [
        ("testContextFromJSON", testContextFromJSON)
    ]

    func testContextFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Context.json")
        let dictionary = fixture as! JSONDictionary
        let context = Context(json: dictionary)

        XCTAssertEqual(context?.ancestors.count, 1)
        XCTAssertEqual(context?.descendants.count, 1)
    }
}
