import XCTest
@testable import MastodonKit

class ReportTests: XCTestCase {
    static var allTests = [
        ("testReportFromJSON", testReportFromJSON)
    ]

    var reportFixture: Any!

    override func setUp() {
        super.setUp()
        reportFixture = try? Fixture.load(fileName: "Fixtures/Report.json")
    }

    func testReportFromJSON() {
        let dictionary = reportFixture as! JSONDictionary
        let report = Report(json: dictionary)

        XCTAssertEqual(report?.id, 42)
        XCTAssertEqual(report?.actionTaken, "account deleted")
    }
}
