import XCTest
@testable import MastodonKit

class ReportsTests: XCTestCase {
    func testAll() {
        let resource = Reports.all()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/reports")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Report]?>.self)
    }

    func testReport() {
        let resource = Reports.report(accountID: 40, statusIDs: [4, 2, 42], reason: "Westworld Spoiler!!!")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/reports")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 5)
        XCTAssertTrue(payload.contains("account_id=40"))
        XCTAssertTrue(payload.contains("status_ids[]=4"))
        XCTAssertTrue(payload.contains("status_ids[]=2"))
        XCTAssertTrue(payload.contains("status_ids[]=42"))
        XCTAssertTrue(payload.contains("comment=Westworld Spoiler!!!"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Report?>.self)
    }
}
