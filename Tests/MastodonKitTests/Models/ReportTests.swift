//
//  ReportTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ReportTests: XCTestCase {
    func testReportFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Report.json")
        let report = try? Report.decode(data: fixture)

        XCTAssertEqual(report?.id, "42")
        XCTAssertEqual(report?.actionTaken, "account deleted")
    }

    func testReportWithInvalidData() {
        let parsed = try? Report.decode(data: Data())

        XCTAssertNil(parsed)
    }

    func testReportsFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Reports.json")
        let parsed = try? [Report].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testReportsWithInvalidData() {
        let parsed = try? [Report].decode(data: Data())

        XCTAssertNil(parsed)
    }
}
