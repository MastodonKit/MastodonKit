//
//  ParameterTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/2/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ParameterTests: XCTestCase {
    func testParameterWithNameAndValue() {
        let parameter = Parameter(name: "name", value: "value")

        XCTAssertEqual(parameter.name, "name")
        XCTAssertEqual(parameter.value, "value")
    }

    func testParameterWithNameOnly() {
        let parameter = Parameter(name: "name", value: nil)

        XCTAssertEqual(parameter.name, "name")
        XCTAssertNil(parameter.value)
    }

    func testEqualWithNilValue() {
        let parameterOne = Parameter(name: "foo", value: nil)
        let parameterTwo = Parameter(name: "foo", value: nil)

        XCTAssertEqual(parameterOne, parameterTwo)
    }

    func testEqualWithValue() {
        let parameterOne = Parameter(name: "foo", value: "bar")
        let parameterTwo = Parameter(name: "foo", value: "bar")

        XCTAssertEqual(parameterOne, parameterTwo)
    }
}
