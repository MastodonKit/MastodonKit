//
//  ResultsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ResultsTests: XCTestCase {
    func testResultsFromValidJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Results.json")
        do {
            let results = try Results.decode(data: fixture)

            XCTAssertEqual(results.accounts.count, 1)
            XCTAssertEqual(results.statuses.count, 1)
            XCTAssertEqual(results.hashtags, ["one", "two", "three"])
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testResultsWithInvalidData() {
        let results = try? Results.decode(data: Data())

        XCTAssertNil(results)
    }
}
