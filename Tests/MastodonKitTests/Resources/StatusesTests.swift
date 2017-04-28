import XCTest
@testable import MastodonKit

class StatusesTests: XCTestCase {
    func testStatus() {
        let resource = Statuses.status(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testContext() {
        let resource = Statuses.context(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/context")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Context?>.self)
    }

    func testCard() {
        let resource = Statuses.card(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/card")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Card?>.self)
    }

    func testRebloggedBy() {
        let resource = Statuses.rebloggedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblogged_by")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFavouritedBy() {
        let resource = Statuses.favouritedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourited_by")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testCreateWithMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!")

        XCTAssertEqual(resource.path, "/api/v1/statuses")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("status=The most awesome status message ever!"))
        XCTAssertTrue(payload.contains("visibility=public"))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithMessageAndReplyID() {
        let resource = Statuses.create(status: "The most awesome status message ever!", replyToID: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=The most awesome status message ever!"))
        XCTAssertTrue(payload.contains("in_reply_to_id=42"))
        XCTAssertTrue(payload.contains("visibility=public"))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithSensitiveMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", sensitive: true)

        XCTAssertEqual(resource.path, "/api/v1/statuses")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=The most awesome status message ever!"))
        XCTAssertTrue(payload.contains("sensitive=true"))
        XCTAssertTrue(payload.contains("visibility=public"))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithSpoilerMessage() {
        let resource = Statuses.create(status: "Can't believe it's an amusement park like Westworld!", spoilerText: "Last night's GoT!!!")

        XCTAssertEqual(resource.path, "/api/v1/statuses")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("status=Can't believe it's an amusement park like Westworld!"))
        XCTAssertTrue(payload.contains("spoiler_text=Last night's GoT!!!"))
        XCTAssertTrue(payload.contains("visibility=public"))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithUnlistedMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", visibility: .unlisted)

        XCTAssertEqual(resource.path, "/api/v1/statuses")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("status=The most awesome status message ever!"))
        XCTAssertTrue(payload.contains("visibility=unlisted"))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testDelete() {
        let resource = Statuses.delete(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42")

        XCTAssertEqual(resource.httpMethod.name, "DELETE")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testReblog() {
        let resource = Statuses.reblog(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblog")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testUnreblog() {
        let resource = Statuses.unreblog(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/unreblog")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testFavourite() {
        let resource = Statuses.favourite(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourite")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testUnfavourite() {
        let resource = Statuses.unfavourite(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/unfavourite")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNil(resource.httpMethod.queryItems)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }
}
