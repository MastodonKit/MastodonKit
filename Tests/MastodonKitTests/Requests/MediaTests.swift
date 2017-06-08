//
//  MediaTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class MediaTests: XCTestCase {
    func testUpload() {
        let request = Media.upload(media: .other(Data(), fileExtension: "fake", mimeType: "media/fake"))

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/media")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Attachment>.self)
    }
}
