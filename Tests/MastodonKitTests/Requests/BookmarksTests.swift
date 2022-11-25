//
//  BookmarksTests.swift
//  
//
//  Created by Stephen Beitzel on 11/25/22.
//  Copyright © 2022 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

final class BookmarksTests: XCTestCase {

    func testRequestAllDefaultLimit() throws {
        let request = Bookmarks.all()
        
        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/bookmarks")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)
    }
}
