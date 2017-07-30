//
//  StatusesTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class StatusesTests: XCTestCase {
    func testStatus() {
        let request = Statuses.status(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testContext() {
        let request = Statuses.context(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/context")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Context>.self)
    }

    func testCard() {
        let request = Statuses.card(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/card")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Card>.self)
    }

    func testRebloggedBy() {
        let request = Statuses.rebloggedBy(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/reblogged_by")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testRebloggedByWithRange() {
        let request = Statuses.rebloggedBy(id: 42, range: .since(id: 12, limit: 50))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "12")
        let expectedLimit = URLQueryItem(name: "limit", value: "50")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/reblogged_by")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testFavouritedBy() {
        let request = Statuses.favouritedBy(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/favourited_by")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testFavouritedByWithRange() {
        let request = Statuses.favouritedBy(id: 42, range: .since(id: 12, limit: 50))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "12")
        let expectedLimit = URLQueryItem(name: "limit", value: "50")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/favourited_by")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testCreateWithMessage() {
        let request = Statuses.create(status: "The most awesome status message ever!")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testCreateWithMessageAndReplyID() {
        let request = Statuses.create(status: "The most awesome status message ever!", replyToID: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("in_reply_to_id=42"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testCreateWithMessageAndMediaIDs() {
        let request = Statuses.create(status: "The most awesome status message ever!", mediaIDs: [1, 2, 42])

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 5)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("visibility=public"))
        XCTAssertTrue(payload.contains("media_ids[]=1"))
        XCTAssertTrue(payload.contains("media_ids[]=2"))
        XCTAssertTrue(payload.contains("media_ids[]=42"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testCreateWithSensitiveMessage() {
        let request = Statuses.create(status: "The most awesome status message ever!", sensitive: true)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("sensitive=true"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testCreateWithSpoilerMessage() {
        let request = Statuses.create(status: "Can't believe it's an amusement park like Westworld!", spoilerText: "Last night's GoT!!!")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=Can%27t%20believe%20it%27s%20an%20amusement%20park%20like%20Westworld%21"))
        XCTAssertTrue(payload.contains("spoiler_text=Last%20night%27s%20GoT%21%21%21"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testCreateWithUnlistedMessage() {
        let request = Statuses.create(status: "The most awesome status message ever!", visibility: .unlisted)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("visibility=unlisted"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testDelete() {
        let request = Statuses.delete(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42")

        // Method
        XCTAssertEqual(request.method.name, "DELETE")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Empty>.self)
    }

    func testReblog() {
        let request = Statuses.reblog(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/reblog")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testUnreblog() {
        let request = Statuses.unreblog(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/unreblog")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testFavourite() {
        let request = Statuses.favourite(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/favourite")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testUnfavourite() {
        let request = Statuses.unfavourite(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/unfavourite")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testMute() {
        let request = Statuses.mute(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/mute")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }

    func testUnmute() {
        let request = Statuses.unmute(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/statuses/42/unmute")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Status>.self)
    }
}
