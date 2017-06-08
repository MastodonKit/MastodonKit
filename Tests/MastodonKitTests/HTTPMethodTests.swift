//
//  HTTPMethodTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class HTTPMethodTests: XCTestCase {
    func testGet() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.get(payload)

        // Name
        XCTAssertEqual(method.name, "GET")

        // Query items
        XCTAssertEqual(method.queryItems?.count, 2)
        XCTAssertEqual(method.queryItems!, payload.items!)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }

    func testGetWithEmptyPayload() {
        let method = HTTPMethod.get(.empty)

        // Name
        XCTAssertEqual(method.name, "GET")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }

    func testPost() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.post(payload)

        // Name
        XCTAssertEqual(method.name, "POST")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNotNil(method.httpBody)
        XCTAssertEqual(method.httpBody, payload.data)

        // Content Type
        XCTAssertNotNil(method.contentType)
        XCTAssertEqual(method.contentType, payload.type)
    }

    func testPostWithEmptyPayload() {
        let method = HTTPMethod.post(.empty)

        // Name
        XCTAssertEqual(method.name, "POST")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }

    func testPatch() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.patch(payload)

        // Name
        XCTAssertEqual(method.name, "PATCH")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNotNil(method.httpBody)
        XCTAssertEqual(method.httpBody, payload.data)

        // Content Type
        XCTAssertNotNil(method.contentType)
        XCTAssertEqual(method.contentType, payload.type)
    }

    func testPatchWithEmptyPayload() {
        let method = HTTPMethod.patch(.empty)

        // Name
        XCTAssertEqual(method.name, "PATCH")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }

    func testDelete() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.delete(payload)

        // Name
        XCTAssertEqual(method.name, "DELETE")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNotNil(method.httpBody)
        XCTAssertEqual(method.httpBody, payload.data)

        // Content Type
        XCTAssertNotNil(method.contentType)
        XCTAssertEqual(method.contentType, payload.type)
    }

    func testDeleteWithEmptyPayload() {
        let method = HTTPMethod.delete(.empty)

        // Name
        XCTAssertEqual(method.name, "DELETE")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }
}
