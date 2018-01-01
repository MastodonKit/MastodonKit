//
//  FollowsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 1/1/18.
//  Copyright © 2018 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class FollowsTests: XCTestCase {
    func testFollows() {
        let request = Follows.follows(uri: "username@domain")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/follows")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 1)
        XCTAssertTrue(payload.contains("uri=username%40domain"))
    }
}
