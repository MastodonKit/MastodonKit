import XCTest
@testable import MastodonKit

class RelationshipTests: XCTestCase {
    static var allTests = [
        ("testRelationshipFromJSON", testRelationshipFromJSON)
    ]

    var relationshipFixture: Any!

    override func setUp() {
        super.setUp()
        relationshipFixture = try? Fixture.load(fileName: "Fixtures/Relationship.json")
    }

    func testRelationshipFromJSON() {
        let dictionary = relationshipFixture as! JSONDictionary
        let relationship = Relationship(json: dictionary)

        XCTAssertEqual(relationship?.id, 42)
        XCTAssertFalse((relationship?.following)!)
        XCTAssertFalse((relationship?.followedBy)!)
        XCTAssertTrue((relationship?.blocking)!)
        XCTAssertFalse((relationship?.muting)!)
        XCTAssertFalse((relationship?.requested)!)
    }
}
