//
//  StringTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/31/17.
//  Copyright (c) 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class StringTests: XCTestCase {
    func testCondensedWithLeadingSpaces() {
        let string = "    this is a string"
        let expectedString = "thisisastring"

        XCTAssertEqual(string.condensed(), expectedString)
    }

    func testCondensedWithTrailingSpaces() {
        let string = "this is a string    "
        let expectedString = "thisisastring"

        XCTAssertEqual(string.condensed(), expectedString)
    }

    func testCondensedWithSeveralSpacesBetweenWords() {
        let string = "this is   a    string"
        let expectedString = "thisisastring"

        XCTAssertEqual(string.condensed(), expectedString)
    }

    func testCondensedWithLeadingSpacesAndSeparator() {
        let string = "    this is a string"

        XCTAssertEqual(string.condensed(separator: " "), "this is a string")
        XCTAssertEqual(string.condensed(separator: "-"), "this-is-a-string")
    }

    func testCondensedWithTrailingSpacesAndSeparator() {
        let string = "this is a string    "

        XCTAssertEqual(string.condensed(separator: " "), "this is a string")
        XCTAssertEqual(string.condensed(separator: "-"), "this-is-a-string")
    }

    func testCondensedWithSeveralSpacesBetweenWordsAndSeparator() {
        let string = "this  is   a    string"

        XCTAssertEqual(string.condensed(separator: " "), "this is a string")
        XCTAssertEqual(string.condensed(separator: "-"), "this-is-a-string")
    }
}
