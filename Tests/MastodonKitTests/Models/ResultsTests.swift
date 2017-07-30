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
    func testResultsFromEmptyJSON() {
        let results = Results(from: [:])

        XCTAssertNil(results)
    }

    func testResultsFromValidJSON() {
        let resultsFixture = try? Fixture.load(fileName: "Fixtures/Results.json")
        let dictionary = resultsFixture as! JSONDictionary
        let results = Results(from: dictionary)

        XCTAssertEqual(results?.accounts.count, 1)
        XCTAssertEqual(results?.statuses.count, 1)
        XCTAssertEqual((results?.hashtags)!, ["one", "two", "three"])
    }
}
