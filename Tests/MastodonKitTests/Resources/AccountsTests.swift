import XCTest
@testable import MastodonKit

class AccountsTests: XCTestCase {
    func testAccount() {
        let resource = Accounts.account(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testCurrentUser() {
        let resource = Accounts.currentUser()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/verify_credentials")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUpdateCurrentUserWithAllFields() {
        let resource = Accounts.updateCurrentUser(displayName: "Ornithologist Coder", note: "Creator of MastodonKit", avatar: "base64 avatar", header: "base64 header")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/update_credentials")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "PATCH")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertTrue(payload.contains("display_name=Ornithologist Coder"))
        XCTAssertTrue(payload.contains("note=Creator of MastodonKit"))
        XCTAssertTrue(payload.contains("avatar=base64 avatar"))
        XCTAssertTrue(payload.contains("header=base64 header"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUpdateCurrentUserWithSomeFields() {
        let resource = Accounts.updateCurrentUser(displayName: "Ornithologist Coder", header: "base64 header")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/update_credentials")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "PATCH")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("display_name=Ornithologist Coder"))
        XCTAssertTrue(payload.contains("header=base64 header"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testFollowers() {
        let resource = Accounts.followers(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/followers")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testFollowing() {
        let resource = Accounts.following(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/following")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testStatuses() {
        let resource = Accounts.statuses(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 0)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testStatusesWithMediaOnly() {
        let resource = Accounts.statuses(id: 42, mediaOnly: true)
        let expectedFlag = URLQueryItem(name: "only_media", value: "true")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedFlag))
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testStatusesWithoutReplies() {
        let resource = Accounts.statuses(id: 42, excludeReplies: true)
        let expectedFlag = URLQueryItem(name: "exclude_replies", value: "true")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedFlag))
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Status]?>.self)
    }

    func testFollow() {
        let resource = Accounts.follow(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/follow")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Paser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testUnfollow() {
        let resource = Accounts.unfollow(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unfollow")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Account?>.self)
    }

    func testBlock() {
        let resource = Accounts.block(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/block")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testUnblock() {
        let resource = Accounts.unblock(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unblock")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testMute() {
        let resource = Accounts.mute(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/mute")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testUnmute() {
        let resource = Accounts.unmute(id: 42)

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unmute")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNil(resource.httpMethod.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Relationship?>.self)
    }

    func testRelationships() {
        let resource = Accounts.relationships(id: 42)
        let expectedID = URLQueryItem(name: "id", value: "42")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/relationships")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 1)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedID))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Relationship]?>.self)
    }

    func testSearchWithoutLimit() {
        let resource = Accounts.search(query: "Ash")
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 2)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }

    func testSearchWithLimit() {
        let resource = Accounts.search(query: "Ash", limit: 42)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "42")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "GET")
        XCTAssertNil(resource.httpMethod.httpBody)
        XCTAssertNotNil(resource.httpMethod.queryItems)
        XCTAssertEqual(resource.httpMethod.queryItems?.count, 2)
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedQuery))
        XCTAssertTrue(resource.httpMethod.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[Account]?>.self)
    }
}
