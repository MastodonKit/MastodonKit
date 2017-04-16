import XCTest
@testable import MastodonKit

class ReportsTests: XCTestCase {
    static var allTests = [
        ("testAll", testAll),
        ("testReport", testReport)
    ]

    func testAll() {
        let resource = Reports.all()

        XCTAssertEqual(resource.path, "/api/v1/reports")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Report]>.self)
    }

    func testReport() {
        let resource = Reports.report(accountID: 40, statusID: 2, reason: "Westworld Spoiler!!!")

        let expectedAccoundID = URLQueryItem(name: "account_id", value: "40")
        let expectedStatusID = URLQueryItem(name: "status_ids", value: "2")
        let expectedVisibility = URLQueryItem(name: "comment", value: "Westworld Spoiler!!!")

        XCTAssertEqual(resource.path, "/api/v1/reports")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedAccoundID))
        XCTAssertTrue(resource.parameters!.contains(expectedStatusID))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Report?>.self)
    }
}
