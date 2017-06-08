//
//  LoginTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class LoginTests: XCTestCase {
    func testSilentLogin() {
        let request = Login.silent(clientID: "client id", clientSecret: "client secret", scopes: [.read, .write], username: "foo", password: "123")

        // Endpoint
        XCTAssertEqual(request.path, "/oauth/token")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 6)
        XCTAssertTrue(payload.contains("client_id=client%20id"))
        XCTAssertTrue(payload.contains("client_secret=client%20secret"))
        XCTAssertTrue(payload.contains("scope=read%20write"))
        XCTAssertTrue(payload.contains("grant_type=password"))
        XCTAssertTrue(payload.contains("username=foo"))
        XCTAssertTrue(payload.contains("password=123"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<LoginSettings>.self)
    }
}
