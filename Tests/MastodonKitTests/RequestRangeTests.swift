import XCTest
@testable import MastodonKit

class RequestRangeTests: XCTestCase {
    func testRangeWithMaxValue() {
        let range = RequestRange.max(id: 42, limit: nil)
        let expectedMaxID = Parameter(name: "max_id", value: "42")
        let expectedLimit = Parameter(name: "limit", value: nil)

        let parameters = range.parameters(limit: between(0, and: 10, fallback: 3))

        XCTAssertEqual(parameters?.count, 2)
        XCTAssertTrue(parameters!.contains(expectedMaxID))
        XCTAssertTrue(parameters!.contains(expectedLimit))
    }

    func testRangeWithMaxValueAndLimit() {
        let range = RequestRange.max(id: 42, limit: 7)
        let expectedMaxID = Parameter(name: "max_id", value: "42")
        let expectedLimit = Parameter(name: "limit", value: "7")

        let parameters = range.parameters(limit: between(0, and: 10, fallback: 3))

        XCTAssertEqual(parameters?.count, 2)
        XCTAssertTrue(parameters!.contains(expectedMaxID))
        XCTAssertTrue(parameters!.contains(expectedLimit))
    }

    func testRangeWithSinceValue() {
        let range = RequestRange.since(id: 80, limit: nil)
        let expectedSinceID = Parameter(name: "since_id", value: "80")
        let expectedLimit = Parameter(name: "limit", value: nil)

        let parameters = range.parameters(limit: between(0, and: 10, fallback: 3))

        XCTAssertEqual(parameters?.count, 2)
        XCTAssertTrue(parameters!.contains(expectedSinceID))
        XCTAssertTrue(parameters!.contains(expectedLimit))
    }

    func testRangeWithMaxSinceAndLimit() {
        let range = RequestRange.since(id: 80, limit: 2)
        let expectedSinceID = Parameter(name: "since_id", value: "80")
        let expectedLimit = Parameter(name: "limit", value: "2")

        let parameters = range.parameters(limit: between(0, and: 10, fallback: 3))

        XCTAssertEqual(parameters?.count, 2)
        XCTAssertTrue(parameters!.contains(expectedSinceID))
        XCTAssertTrue(parameters!.contains(expectedLimit))
    }

    func testRangeWithLimitOnly() {
        let range = RequestRange.limit(42)
        let expectedLimit = Parameter(name: "limit", value: "42")

        let parameters = range.parameters(limit: between(0, and: 80, fallback: 40))

        XCTAssertEqual(parameters?.count, 1)
        XCTAssertTrue(parameters!.contains(expectedLimit))
    }

    func testRangeWithDefault() {
        let range = RequestRange.default

        let parameters = range.parameters(limit: between(0, and: 80, fallback: 40))

        XCTAssertNil(parameters)
    }
}
