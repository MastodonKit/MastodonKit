import XCTest
@testable import MastodonKit

class StatusesTests: XCTestCase {
    func testStatus() {
        let resource = Statuses.status(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testContext() {
        let resource = Statuses.context(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/context")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Context?>.self)
    }

    func testCard() {
        let resource = Statuses.card(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/card")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Card?>.self)
    }

    func testRebloggedBy() {
        let resource = Statuses.rebloggedBy(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblogged_by")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testRebloggedByWithRange() {
        let resource = Statuses.rebloggedBy(id: 42, range: .since(id: 12, limit: 50))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "12")
        let expectedLimit = URLQueryItem(name: "limit", value: "50")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblogged_by")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFavouritedBy() {
        let resource = Statuses.favouritedBy(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourited_by")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFavouritedByWithRange() {
        let resource = Statuses.favouritedBy(id: 42, range: .since(id: 12, limit: 50))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "12")
        let expectedLimit = URLQueryItem(name: "limit", value: "50")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourited_by")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testCreateWithMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithMessageAndReplyID() {
        let resource = Statuses.create(status: "The most awesome status message ever!", replyToID: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("in_reply_to_id=42"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithMessageAndMediaIDs() {
        let resource = Statuses.create(status: "The most awesome status message ever!", mediaIDs: [1, 2, 42])

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 5)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("visibility=public"))
        XCTAssertTrue(payload.contains("media_ids[]=1"))
        XCTAssertTrue(payload.contains("media_ids[]=2"))
        XCTAssertTrue(payload.contains("media_ids[]=42"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithSensitiveMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", sensitive: true)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("sensitive=true"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithSpoilerMessage() {
        let resource = Statuses.create(status: "Can't believe it's an amusement park like Westworld!", spoilerText: "Last night's GoT!!!")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=Can%27t%20believe%20it%27s%20an%20amusement%20park%20like%20Westworld%21"))
        XCTAssertTrue(payload.contains("spoiler_text=Last%20night%27s%20GoT%21%21%21"))
        XCTAssertTrue(payload.contains("visibility=public"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithUnlistedMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", visibility: .unlisted)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("status=The%20most%20awesome%20status%20message%20ever%21"))
        XCTAssertTrue(payload.contains("visibility=unlisted"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testDelete() {
        let resource = Statuses.delete(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42")

        // Method
        XCTAssertEqual(resource.method.name, "DELETE")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testReblog() {
        let resource = Statuses.reblog(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblog")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testUnreblog() {
        let resource = Statuses.unreblog(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/unreblog")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testFavourite() {
        let resource = Statuses.favourite(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourite")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testUnfavourite() {
        let resource = Statuses.unfavourite(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/statuses/42/unfavourite")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }
}
