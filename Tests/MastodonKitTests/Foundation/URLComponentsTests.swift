//
//  URLComponentsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class URLComponentsTests: XCTestCase {
    func testURLComponentsWithValidBaseURL() {
        let request = Request<String>(path: "/string") { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", request: request)

        XCTAssertEqual(components?.url, URL(string: "https://mastodon.technology/string"))
    }

    func testURLComponentsWithInvalidBaseURL() {
        let request = Request<String>(path: "/string") { _ in return "string" }
        let components = URLComponents(baseURL: "this is an invalid base url", request: request)

        XCTAssertNil(components)
    }

    func testURLComponentsWithInValidRequestPath() {
        let request = Request<String>(path: "invalid endpoint") { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", request: request)

        XCTAssertNil(components)
    }

    func testURLComponentsWithBaseURLAndQueryItems() {
        let parameters = [
            Parameter(name: "a", value: "0"),
            Parameter(name: "b", value: "1")
        ]

        let request = Request<String>(path: "/string", method: .get(.parameters(parameters))) { _ in return "string" }
        let components = URLComponents(baseURL: "https://mastodon.technology", request: request)

        XCTAssertEqual(components?.url, URL(string: "https://mastodon.technology/string?a=0&b=1"))
    }
}
