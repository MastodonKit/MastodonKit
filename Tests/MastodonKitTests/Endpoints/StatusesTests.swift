import XCTest
@testable import MastodonKit

class StatusesTests: XCTestCase {
    func testStatus() {
        let resource = Statuses.status(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testContext() {
        let resource = Statuses.context(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/context")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Context?>.self)
    }

    func testCard() {
        let resource = Statuses.card(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/card")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Card?>.self)
    }

    func testRebloggedBy() {
        let resource = Statuses.rebloggedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblogged_by")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]>.self)
    }

    func testFavouritedBy() {
        let resource = Statuses.favouritedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourited_by")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]>.self)
    }

    func testCreateWithMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!")

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithMessageAndReplyID() {
        let resource = Statuses.create(status: "The most awesome status message ever!", replyToID: 42)

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedReplyToID = URLQueryItem(name: "in_reply_to_id", value: "42")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedReplyToID))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithSensitiveMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", sensitive: true)

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedSensitive = URLQueryItem(name: "sensitive", value: "true")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedSensitive))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithSpoilerMessage() {
        let resource = Statuses.create(status: "Can't believe it's an amusement park like Westworld!", spoilerText: "Last night's GoT!!!")

        let expectedStatus = URLQueryItem(name: "status", value: "Can't believe it's an amusement park like Westworld!")
        let expectedSpoilerMessage = URLQueryItem(name: "spoiler_text", value: "Last night's GoT!!!")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedSpoilerMessage))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testCreateWithUnlistedMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", visibility: .unlisted)

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "unlisted")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testDelete() {
        let resource = Statuses.delete(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42")
        XCTAssertEqual(resource.httpMethod, .delete)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testReblog() {
        let resource = Statuses.reblog(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblog")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testUnreblog() {
        let resource = Statuses.unreblog(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/unreblog")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testFavourite() {
        let resource = Statuses.favourite(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourite")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }

    func testUnfavourite() {
        let resource = Statuses.unfavourite(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/unfavourite")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Status?>.self)
    }
}
