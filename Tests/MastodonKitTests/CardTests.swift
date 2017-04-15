import XCTest
@testable import MastodonKit

class CardTests: XCTestCase {
    static var allTests = [
        ("testCardFromJSON", testCardFromJSON)
    ]

    var cardFixture: Any!

    override func setUp() {
        super.setUp()
        cardFixture = try? Fixture.load(fileName: "Fixtures/Card.json")
    }

    func testCardFromJSON() {
        let dictionary = cardFixture as! JSONDictionary
        let card = Card(json: dictionary)

        XCTAssertEqual(card?.url, URL(string: "http://lorempixel.com/200/200/cats/3/"))
        XCTAssertEqual(card?.title, "Awesome card title")
        XCTAssertEqual(card?.description, "Card description")
        XCTAssertEqual(card?.image, URL(string: "http://lorempixel.com/200/200/cats/1/"))
    }
}
