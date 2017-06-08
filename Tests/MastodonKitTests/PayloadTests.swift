//
//  PayloadTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/28/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class PayloadTests: XCTestCase {
    func testParametersWithValidValue() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)

        // Items
        let expectedNumber = URLQueryItem(name: "number", value: "42")
        let expectedURL = URLQueryItem(name: "url", value: "https://mastodon.technology")

        XCTAssertEqual(payload.items?.count, 2)
        XCTAssertTrue(payload.items!.contains(expectedNumber))
        XCTAssertTrue(payload.items!.contains(expectedURL))

        // Data
        let expectedData = "number=42&url=https%3A//mastodon.technology".data(using: .utf8)

        XCTAssertEqual(payload.data, expectedData)
    }

    func testParametersWithNilValue() {
        let payload = Payload.parameters(nil)

        XCTAssertNil(payload.items)
        XCTAssertNil(payload.data)
        XCTAssertNil(payload.type)
    }

    func testMediaWithValidValue() {
        let imageData = "image data".data(using: .utf8)

        let payload = Payload.media(.jpeg(imageData))

        // Items
        XCTAssertNil(payload.items)

        // Data
        let payloadData = String(data: payload.data!, encoding: .utf8)

        XCTAssertNotNil(payload.data)
        XCTAssertEqual(payloadData, "--MastodonKitBoundary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"file.jpg\"\r\nContent-Type: image/jpg\r\n\r\nimage data\r\n--MastodonKitBoundary--\r\n")
        XCTAssertEqual(payload.type, "multipart/form-data; boundary=MastodonKitBoundary")
    }

    func testMediaWithNilValue() {
        let payload = Payload.media(nil)

        XCTAssertNil(payload.items)
        XCTAssertNil(payload.data)
        XCTAssertNil(payload.type)
    }

    func testEmpty() {
        let payload = Payload.empty

        XCTAssertNil(payload.items)
        XCTAssertNil(payload.data)
        XCTAssertNil(payload.type)
    }
}
