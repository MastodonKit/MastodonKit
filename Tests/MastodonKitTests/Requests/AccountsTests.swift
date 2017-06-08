//
//  AccountsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class AccountsTests: XCTestCase {
    func testAccount() {
        let request = Accounts.account(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Account>.self)
    }

    func testCurrentUser() {
        let request = Accounts.currentUser()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/verify_credentials")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Account>.self)
    }

    func testUpdateCurrentUserWithAllFields() {
        let avatar = MediaAttachment.jpeg(Data(count: 8))
        let header = MediaAttachment.png(Data(count: 8))

        let request = Accounts.updateCurrentUser(displayName: "Ornithologist Coder", note: "Creator of MastodonKit", avatar: avatar, header: header)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/update_credentials")

        // Method
        XCTAssertEqual(request.method.name, "PATCH")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertTrue(payload.contains("display_name=Ornithologist%20Coder"))
        XCTAssertTrue(payload.contains("note=Creator%20of%20MastodonKit"))
        XCTAssertTrue(payload.contains("avatar=data%3Aimage/jpg%3Bbase64%2CAAAAAAAAAAA%3D"))
        XCTAssertTrue(payload.contains("header=data%3Aimage/png%3Bbase64%2CAAAAAAAAAAA%3D"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Account>.self)
    }

    func testUpdateCurrentUserWithSomeFields() {
        let request = Accounts.updateCurrentUser(displayName: "Ornithologist Coder", note: "Creator of MastodonKit")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/update_credentials")

        // Method
        XCTAssertEqual(request.method.name, "PATCH")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 2)
        XCTAssertTrue(payload.contains("display_name=Ornithologist%20Coder"))
        XCTAssertTrue(payload.contains("note=Creator%20of%20MastodonKit"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Account>.self)
    }

    func testFollowers() {
        let request = Accounts.followers(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/followers")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testFollowersWithRange() {
        let request = Accounts.followers(id: 42, range: .since(id: 420, limit: 37))
        let expectedMaxID = URLQueryItem(name: "since_id", value: "420")
        let expectedLimit = URLQueryItem(name: "limit", value: "37")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/followers")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedMaxID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testFollowing() {
        let request = Accounts.following(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/following")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testFollowingWithRange() {
        let request = Accounts.following(id: 42, range: .limit(17))
        let expectedLimit = URLQueryItem(name: "limit", value: "17")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/following")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 1)
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testStatuses() {
        let request = Accounts.statuses(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertEqual(request.method.queryItems?.count, 0)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testStatusesWithRange() {
        let request = Accounts.statuses(id: 42, range: .since(id: 10, limit: 20))
        let expectedSinceID = URLQueryItem(name: "since_id", value: "10")
        let expectedLimit = URLQueryItem(name: "limit", value: "20")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedSinceID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testStatusesWithMediaOnly() {
        let request = Accounts.statuses(id: 42, mediaOnly: true)
        let expectedFlag = URLQueryItem(name: "only_media", value: "true")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertTrue(request.method.queryItems!.contains(expectedFlag))
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testStatusesWithoutReplies() {
        let request = Accounts.statuses(id: 42, excludeReplies: true)
        let expectedFlag = URLQueryItem(name: "exclude_replies", value: "true")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/statuses")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertTrue(request.method.queryItems!.contains(expectedFlag))
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Status]>.self)
    }

    func testFollow() {
        let request = Accounts.follow(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/follow")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Paser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Account>.self)
    }

    func testUnfollow() {
        let request = Accounts.unfollow(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/unfollow")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Account>.self)
    }

    func testBlock() {
        let request = Accounts.block(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/block")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Relationship>.self)
    }

    func testUnblock() {
        let request = Accounts.unblock(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/unblock")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Relationship>.self)
    }

    func testMute() {
        let request = Accounts.mute(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/mute")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Relationship>.self)
    }

    func testUnmute() {
        let request = Accounts.unmute(id: 42)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/42/unmute")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Relationship>.self)
    }

    func testRelationships() {
        let request = Accounts.relationships(ids: [42, 52])
        let expectedID42 = URLQueryItem(name: "id[]", value: "42")
        let expectedID52 = URLQueryItem(name: "id[]", value: "52")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/relationships")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedID42))
        XCTAssertTrue(request.method.queryItems!.contains(expectedID52))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Relationship]>.self)
    }

    func testSearchWithoutLimit() {
        let request = Accounts.search(query: "Ash")
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 1)
        XCTAssertTrue(request.method.queryItems!.contains(expectedQuery))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testSearchWithValidLimit() {
        let request = Accounts.search(query: "Ash", limit: 42)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "42")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testSearchWithLimitBelowMinimumValue() {
        let request = Accounts.search(query: "Ash", limit: 0)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }

    func testSearchWithLimitAboveMaximumValue() {
        let request = Accounts.search(query: "Ash", limit: 81)
        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/accounts/search")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNotNil(request.method.queryItems)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedQuery))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<[Account]>.self)
    }
}
