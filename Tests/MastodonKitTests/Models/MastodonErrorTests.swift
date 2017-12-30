//
//  MastodonErrorTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class MastodonErrorTests: XCTestCase {
    func testErrorWithValidJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/RequestError.json")
        let requestError = try? MastodonError.decode(data: fixture)

        XCTAssertEqual(requestError?.description, "yes, it's an error.")
    }

    func testErrorWithInvalidData() {
        let requestError = try? MastodonError.decode(data: Data())

        XCTAssertNil(requestError)
    }
}
