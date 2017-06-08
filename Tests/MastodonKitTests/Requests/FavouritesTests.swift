//
//  FavouritesTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class FavouritesTests: XCTestCase {
    func testAll() {
        let request = Favourites.all()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/favourites")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testAllWithRange() {
        let request = Favourites.all(range: .since(id: 42, limit: nil))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "42")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/favourites")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 1)
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }
}
