import XCTest
@testable import MastodonKit

class RequestErrorTests: XCTestCase {
    static var allTests = [
        ("testErrorFromJSON", testErrorFromJSON)
    ]

    var errorFixture: Any!

    override func setUp() {
        super.setUp()
        errorFixture = try? Fixture.load(fileName: "Fixtures/RequestError.json")
    }

    func testErrorFromJSON() {
        let dictionary = errorFixture as! JSONDictionary
        let requestError = RequestError(json: dictionary)

        switch requestError {
        case .apiError(let reason):
            XCTAssertEqual(reason, "yes, it's an error.")
            break
        }
    }
}
