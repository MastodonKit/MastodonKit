import XCTest
@testable import MastodonKit

class ReportsTests: XCTestCase {
    static var allTests = [
        ("testAll", testAll)
    ]

    func testAll() {
        let resource = Reports.all()

        XCTAssertEqual(resource.path, "/api/v1/reports")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }
}
