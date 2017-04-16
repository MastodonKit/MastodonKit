import XCTest
@testable import MastodonKit

class ReportTests: XCTestCase {
    static var allTests = [
        ("testReportFromJSON", testReportFromJSON)
    ]

    func testReportFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Report.json")
        let dictionary = fixture as! JSONDictionary
        let report = Report(json: dictionary)

        XCTAssertEqual(report?.id, 42)
        XCTAssertEqual(report?.actionTaken, "account deleted")
    }
}
