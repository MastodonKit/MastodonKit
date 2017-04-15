import XCTest
@testable import MastodonKit

class ContextTests: XCTestCase {
    static var allTests = [
        ("testContextFromJSON", testContextFromJSON)
    ]

    var contextFixture: Any!

    override func setUp() {
        super.setUp()
        contextFixture = try? Fixture.load(fileName: "Fixtures/Context.json")
    }

    func testContextFromJSON() {
        let dictionary = contextFixture as! JSONDictionary
        let context = Context(json: dictionary)

        XCTAssertEqual(context?.ancestors.count, 1)
        XCTAssertEqual(context?.descendants.count, 1)
    }
}
