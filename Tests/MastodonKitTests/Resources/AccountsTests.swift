import XCTest
@testable import MastodonKit

class AccountsTests: XCTestCase {
    func testAccount() {
        let resource = Accounts.account(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testCurrentUser() {
        let resource = Accounts.currentUser()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/verify_credentials")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUpdateCurrentUserWithAllFields() {
        let resource = Accounts.updateCurrentUser(displayName: "Ornithologist Coder", note: "Creator of MastodonKit", avatar: "base64 avatar", header: "base64 header")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/update_credentials")

        // Method
        XCTAssertEqual(resource.method.name, "PATCH")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertTrue(payload.contains("display_name=Ornithologist%20Coder"))
        XCTAssertTrue(payload.contains("note=Creator%20of%20MastodonKit"))
        XCTAssertTrue(payload.contains("avatar=base64%20avatar"))
        XCTAssertTrue(payload.contains("header=base64%20header"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUpdateCurrentUserWithSomeFields() {
        let resource = Accounts.updateCurrentUser(displayName: "Ornithologist Coder", header: "base64 header")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/update_credentials")

        // Method
        XCTAssertEqual(resource.method.name, "PATCH")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("display_name=Ornithologist%20Coder"))
        XCTAssertTrue(payload.contains("header=base64%20header"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testFollowers() {
        let resource = Accounts.followers(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/followers")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFollowersWithRange() {
        let resource = Accounts.followers(id: 42, range: .since(id: 420, limit: 37))
        let expectedMaxID = URLQueryItem(name: "since_id", value: "420")
        let expectedLimit = URLQueryItem(name: "limit", value: "37")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/followers")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedMaxID))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFollowing() {
        let resource = Accounts.following(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/following")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFollowingWithRange() {
        let resource = Accounts.following(id: 42, range: .limit(17))
        let expectedLimit = URLQueryItem(name: "limit", value: "17")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/following")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 1)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testStatuses() {
        let resource = Accounts.statuses(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertEqual(resource.method.queryItems?.count, 0)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testStatusesWithRange() {
        let resource = Accounts.statuses(id: 42, range: .since(id: 10, limit: 20))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "10")
        let expectedLimit = URLQueryItem(name: "limit", value: "20")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testStatusesWithMediaOnly() {
        let resource = Accounts.statuses(id: 42, mediaOnly: true)
        let expectedFlag = URLQueryItem(name: "only_media", value: "true")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertTrue(resource.method.queryItems!.contains(expectedFlag))
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testStatusesWithoutReplies() {
        let resource = Accounts.statuses(id: 42, excludeReplies: true)
        let expectedFlag = URLQueryItem(name: "exclude_replies", value: "true")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertTrue(resource.method.queryItems!.contains(expectedFlag))
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testFollow() {
        let resource = Accounts.follow(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/follow")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Paser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUnfollow() {
        let resource = Accounts.unfollow(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unfollow")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testBlock() {
        let resource = Accounts.block(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/block")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testUnblock() {
        let resource = Accounts.unblock(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unblock")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testMute() {
        let resource = Accounts.mute(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/mute")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testUnmute() {
        let resource = Accounts.unmute(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unmute")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testRelationships() {
        let resource = Accounts.relationships(ids: [42, 52])
        let expectedID42 = URLQueryItem(name: "id[]", value: "42")
        let expectedID52 = URLQueryItem(name: "id[]", value: "52")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/relationships")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedID42))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedID52))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Relationship]?>.self)
    }

    func testSearchWithoutLimit() {
        let resource = Accounts.search(query: "Ash")
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 1)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedQuery))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testSearchWithValidLimit() {
        let resource = Accounts.search(query: "Ash", limit: 42)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "42")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testSearchWithLimitBelowMinimumValue() {
        let resource = Accounts.search(query: "Ash", limit: 0)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testSearchWithLimitAboveMaximumValue() {
        let resource = Accounts.search(query: "Ash", limit: 81)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNotNil(resource.method.queryItems)
        XCTAssertEqual(resource.method.queryItems?.count, 2)
        XCTAssertTrue(resource.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
