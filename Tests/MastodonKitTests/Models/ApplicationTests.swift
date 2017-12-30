//
//  ApplicationTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ApplicationTests: XCTestCase {
    func testApplicationFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Application.json")
        let application = try? Application.decode(data: fixture)

        XCTAssertEqual(application?.name, "MastodonKitTestClient")
        XCTAssertEqual(application?.website, "https://github.com/ornithocoder/MastodonKit")
    }

    func testApplicationWithInvalidData() {
        let application = try? Application.decode(data: Data())

        XCTAssertNil(application)
    }
}
