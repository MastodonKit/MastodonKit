//
//  ClientApplicationTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ClientApplicationTests: XCTestCase {
    func testClientApplicationFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/ClientApplication.json")
        let application = try? ClientApplication.decode(data: fixture)

        XCTAssertEqual(application?.id, "42")
        XCTAssertEqual(application?.redirectURI, "urn:ietf:wg:oauth:2.0:oob")
        XCTAssertEqual(application?.clientID, "very_long_client_id")
        XCTAssertEqual(application?.clientSecret, "very_long_client_secret")
    }

    func testClientApplicationWithInvalidData() {
        let parsed = try? ClientApplication.decode(data: Data())

        XCTAssertNil(parsed)
    }
}
