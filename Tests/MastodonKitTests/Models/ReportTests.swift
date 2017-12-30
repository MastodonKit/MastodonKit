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
}
