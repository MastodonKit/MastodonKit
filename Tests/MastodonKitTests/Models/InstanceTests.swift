//
//  InstanceTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class InstanceTests: XCTestCase {
    func testInstanceFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Instance.json")
        let instance = try? Instance.decode(data: fixture)

        XCTAssertEqual(instance?.uri, "instance's uri")
        XCTAssertEqual(instance?.title, "nice title")
        XCTAssertEqual(instance?.description, "sweet description")
        XCTAssertEqual(instance?.email, "wunderbar email")
        XCTAssertEqual(instance?.version, "1.2.3")
    }

    func testInstanceWithInvalidData() {
        let parsed = try? Instance.decode(data: Data())

        XCTAssertNil(parsed)
    }
}
