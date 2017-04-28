import XCTest
@testable import MastodonKit

class AccountsTests: XCTestCase {
    func testAccount() {
        let resource = Accounts.account(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testCurrentUser() {
        let resource = Accounts.currentUser()

        XCTAssertEqual(resource.path, "/api/v1/accounts/verify_credentials")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testFollowers() {
        let resource = Accounts.followers(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/followers")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFollowing() {
        let resource = Accounts.following(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/following")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testStatuses() {
        let resource = Accounts.statuses(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testFollow() {
        let resource = Accounts.follow(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/follow")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUnfollow() {
        let resource = Accounts.unfollow(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unfollow")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testBlock() {
        let resource = Accounts.block(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/block")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testUnblock() {
        let resource = Accounts.unblock(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unblock")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testMute() {
        let resource = Accounts.mute(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/mute")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testUnmute() {
        let resource = Accounts.unmute(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unmute")

        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testRelationships() {
        let resource = Accounts.relationships(id: 42)

        let expectedID = URLQueryItem(name: "id", value: "42")

        XCTAssertEqual(resource.path, "/api/v1/accounts/relationships")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)

        XCTAssertEqual(resource.httpMethod.queryItems?.count, 1)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedID))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Relationship]?>.self)
    }

    func testSearchWithoutLimit() {
        let resource = Accounts.search(query: "Ash")

        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)

        XCTAssertEqual(resource.httpMethod.queryItems?.count, 2)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedLimit))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testSearchWithLimit() {
        let resource = Accounts.search(query: "Ash", limit: 42)

        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "42")

        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)

        XCTAssertEqual(resource.httpMethod.queryItems?.count, 2)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedLimit))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
