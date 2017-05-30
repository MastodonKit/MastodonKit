//
//  ResultsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ResultsTests: XCTestCase {
    func testResultsWithNullFromJSON() {
        let resultsFixture = try? Fixture.load(fileName: "Fixtures/ResultsWithNull.json")
        let dictionary = resultsFixture as! JSONDictionary
        let results = Results(from: dictionary)

        XCTAssertNil(results?.accounts)
        XCTAssertNil(results?.hashtags)
        XCTAssertNil(results?.statuses)
    }

    func testResultsWithoutNullFromJSON() {
        let resultsFixture = try? Fixture.load(fileName: "Fixtures/ResultsWithoutNull.json")
        let dictionary = resultsFixture as! JSONDictionary
        let results = Results(from: dictionary)

        XCTAssertEqual(results?.accounts?.count, 1)
        XCTAssertEqual(results?.statuses?.count, 1)
        XCTAssertEqual((results?.hashtags)!, ["one", "two", "three"])
    }
}
