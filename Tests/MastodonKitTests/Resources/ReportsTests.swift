import XCTest
@testable import MastodonKit

class ReportsTests: XCTestCase {
    func testAll() {
        let resource = Reports.all()

        XCTAssertEqual(resource.path, "/api/v1/reports")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Report]?>.self)
    }

    func testReport() {
        let resource = Reports.report(accountID: 40, statusID: 2, reason: "Westworld Spoiler!!!")

        XCTAssertEqual(resource.path, "/api/v1/reports")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("account_id=40"))
        XCTAssertTrue(payload.contains("status_ids=2"))
        XCTAssertTrue(payload.contains("comment=Westworld Spoiler!!!"))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Report?>.self)
    }
}
