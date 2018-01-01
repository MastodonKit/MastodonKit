//
//  FunctionsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/23/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class FunctionsTests: XCTestCase {
    func testAccessScopeToString() {
        XCTAssertEqual(toString(scope: .read), "read")
        XCTAssertEqual(toString(scope: .write), "write")
        XCTAssertEqual(toString(scope: .follow), "follow")
    }

    func testOptionalToNilOrStringFromOptionalString() {
        let invalidString: String? = nil
        let validString: String? = "foo"

        XCTAssertNil(toOptionalString(optional: invalidString))
        XCTAssertEqual(toOptionalString(optional: validString), "foo")
    }

    func testOptionalToNilOrStringFromOptionalInteger() {
        let invalidInteger: Int? = nil
        let validInteger: Int? = 42

        XCTAssertNil(toOptionalString(optional: invalidInteger))
        XCTAssertEqual(toOptionalString(optional: validInteger), "42")
    }

    func testOptionalToNilOrStringFromOptionalBoolean() {
        let invalidBoolean: Bool? = nil
        let validTrueBoolean: Bool? = true
        let validFalseBoolean: Bool? = false

        XCTAssertNil(toOptionalString(optional: invalidBoolean))
        XCTAssertEqual(toOptionalString(optional: validTrueBoolean), "true")
        XCTAssertEqual(toOptionalString(optional: validFalseBoolean), "false")
    }

    func testNilOrTrue() {
        XCTAssertNil(trueOrNil(false))
        XCTAssertEqual(trueOrNil(true), "true")
    }

    func testArrayOfParametersWithInteger() {
        let parameters = toArrayOfParameters(withName: "foo")(42)

        XCTAssertEqual(parameters.name, "foo[]")
        XCTAssertEqual(parameters.value, "42")
    }

    func testArrayOfParametersWithString() {
        let parameters = toArrayOfParameters(withName: "foo")("bar")

        XCTAssertEqual(parameters.name, "foo[]")
        XCTAssertEqual(parameters.value, "bar")
    }

    func testBetweenMaxAndMinWithinValidRange() {
        let limitFunction = between(3, and: 7, default: 5)

        XCTAssertEqual(limitFunction(4), 4)
    }

    func testBetweenMaxAndMinBelowMinimumValue() {
        let limitFunction = between(10, and: 20, default: 13)

        XCTAssertEqual(limitFunction(9), 13)
    }

    func testBetweenMaxAndMinEqualMinimumValue() {
        let limitFunction = between(10, and: 20, default: 13)

        XCTAssertEqual(limitFunction(10), 10)
    }

    func testBetweenMaxAndMinAboveMaximumValue() {
        let limitFunction = between(10, and: 20, default: 13)

        XCTAssertEqual(limitFunction(21), 13)
    }

    func testBetweenMaxAndMinEqualMaximumValue() {
        let limitFunction = between(10, and: 20, default: 13)

        XCTAssertEqual(limitFunction(20), 20)
    }

    func testTrim() {
        let trimmer = trim(left: "{", right: "}")
        let emojiTrimmer = trim(left: "🐵", right: "🙉")

        XCTAssertEqual(trimmer("{valid string}"), "valid string")
        XCTAssertEqual(trimmer("{another string"), "{another string")
        XCTAssertEqual(trimmer("another string}"), "another string}")
        XCTAssertEqual(emojiTrimmer("🐵🙈🙉"), "🙈")
        XCTAssertEqual(emojiTrimmer("🙉🙈🐵"), "🙉🙈🐵")
    }

    func testQueryItemToOptionalInteger() {
        let validItem = URLQueryItem(name: "toto", value: "42")
        let anotherValidItem = URLQueryItem(name: "toto", value: "-42")
        let invalidItem = URLQueryItem(name: "toto", value: "")
        let anotherInvalidItem = URLQueryItem(name: "toto", value: "covfefe")
        let nilValueItem = URLQueryItem(name: "toto", value: nil)

        XCTAssertEqual(toInteger(item: validItem), 42)
        XCTAssertEqual(toInteger(item: anotherValidItem), -42)
        XCTAssertNil(toInteger(item: invalidItem))
        XCTAssertNil(toInteger(item: anotherInvalidItem))
        XCTAssertNil(toInteger(item: nilValueItem))
    }
}
