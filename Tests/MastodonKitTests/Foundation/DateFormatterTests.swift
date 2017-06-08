//
//  DateFormatterTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class DateFormatterTests: XCTestCase {
    func testDateFromMastodonWithValidDate() {
        let date = DateFormatter.mastodonFormatter.date(from: "2016-12-20T13:14:15.132Z")

        XCTAssertEqual(date?.timeIntervalSince1970, 1482239655.132)
    }

    func testDateFromMastodonWithInvalidDate() {
        let date = DateFormatter.mastodonFormatter.date(from: "2016-12-20")

        XCTAssertNil(date)
    }
}
