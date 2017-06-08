//
//  ReportsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ReportsTests: XCTestCase {
    func testAll() {
        let request = Reports.all()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/reports")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Report]>.self)
    }

    func testReport() {
        let request = Reports.report(accountID: 40, statusIDs: [4, 2, 42], reason: "Westworld Spoiler!!!")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/reports")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 5)
        XCTAssertTrue(payload.contains("account_id=40"))
        XCTAssertTrue(payload.contains("status_ids[]=4"))
        XCTAssertTrue(payload.contains("status_ids[]=2"))
        XCTAssertTrue(payload.contains("status_ids[]=42"))
        XCTAssertTrue(payload.contains("comment=Westworld%20Spoiler%21%21%21"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Report>.self)
    }
}
