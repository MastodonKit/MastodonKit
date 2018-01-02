//
//  LoginSettingsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/18/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class LoginSettingsTests: XCTestCase {
    func testLoginSettingsFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let loginSettings = try? LoginSettings.decode(data: fixture)

        XCTAssertEqual(loginSettings?.accessToken, "the secret code is yellow")
        XCTAssertEqual(loginSettings?.accessTokenType, "bär")
        XCTAssertEqual((loginSettings?.scopes)!, [.read, .write])
        XCTAssertEqual(loginSettings?.createdAt, 1492249031)
    }

    func testLoginSettingsWithInvalidData() {
        let parsed = try? LoginSettings.decode(data: Data())

        XCTAssertNil(parsed)
    }
}
