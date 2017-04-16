import XCTest
@testable import MastodonKit

class RequestErrorTests: XCTestCase {
    static var allTests = [
        ("testErrorWithValidJSON", testErrorWithValidJSON),
        ("testErrorWithInvalidJSON", testErrorWithInvalidJSON)
    ]

    func testErrorWithValidJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/RequestError.json")
        let dictionary = fixture as! JSONDictionary
        let requestError = RequestError(json: dictionary)

        switch requestError {
        case .apiError(let reason):
            XCTAssertEqual(reason, "yes, it's an error.")
            break
        }
    }

    func testErrorWithInvalidJSON() {
        let requestError = RequestError(json: [:])

        switch requestError {
        case .apiError(let reason):
            XCTAssertNil(reason)
            break
        }
    }
}
