import XCTest
@testable import MastodonKit

class RelationshipTests: XCTestCase {
    func testRelationshipFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Relationship.json")
        let dictionary = fixture as! JSONDictionary
        let relationship = Relationship(json: dictionary)

        XCTAssertEqual(relationship?.id, 42)
        XCTAssertFalse((relationship?.following)!)
        XCTAssertFalse((relationship?.followedBy)!)
        XCTAssertTrue((relationship?.blocking)!)
        XCTAssertFalse((relationship?.muting)!)
        XCTAssertFalse((relationship?.requested)!)
    }
}
