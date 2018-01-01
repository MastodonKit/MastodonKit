//
//  InstancesTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class InstancesTests: XCTestCase {
    func testCurrent() {
        let request = Instances.current()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/instance")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)
    }

    func testCustomEmojis() {
        let request = Instances.customEmojis()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/custom_emojis")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)
    }
}
