import XCTest
@testable import MastodonKit

class ReportTests: XCTestCase {
    func testReportFromJSON() {
        let fixture = try? Fixture.load(fileName: "Fixtures/Report.json")
        let dictionary = fixture as! JSONDictionary
        let report = Report(from: dictionary)

        XCTAssertEqual(report?.id, 42)
        XCTAssertEqual(report?.actionTaken, "account deleted")
    }
}
