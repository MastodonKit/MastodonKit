import XCTest
@testable import MastodonKit

class AccountsTests: XCTestCase {
    static var allTests = [
        ("testAccount", testAccount),
        ("testCurrentUser", testCurrentUser),
        ("testFollowers", testFollowers),
        ("testFollowing", testFollowing),
        ("testStatuses", testStatuses),
        ("testFollow", testFollow),
        ("testUnfollow", testUnfollow),
        ("testBlock", testBlock),
        ("testUnblock", testUnblock),
        ("testMute", testMute),
        ("testUnmute", testUnmute),
        ("testSearchWithoutLimit", testSearchWithoutLimit),
        ("testSearchWithLimit", testSearchWithLimit)
    ]

    func testAccount() {
        let resource = Accounts.account(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testCurrentUser() {
        let resource = Accounts.currentUser()

        XCTAssertEqual(resource.path, "/api/v1/accounts/verify_credentials")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testFollowers() {
        let resource = Accounts.followers(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/followers")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testFollowing() {
        let resource = Accounts.following(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/following")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testStatuses() {
        let resource = Accounts.statuses(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/statuses")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testFollow() {
        let resource = Accounts.follow(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/follow")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testUnfollow() {
        let resource = Accounts.unfollow(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unfollow")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testBlock() {
        let resource = Accounts.block(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/block")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testUnblock() {
        let resource = Accounts.unblock(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unblock")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testMute() {
        let resource = Accounts.mute(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/mute")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testUnmute() {
        let resource = Accounts.unmute(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/accounts/42/unmute")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testSearchWithoutLimit() {
        let resource = Accounts.search(query: "Ash")

        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "40")

        XCTAssertEqual(resource.path, "/api/v1/accounts/search")
        XCTAssertEqual(resource.httpMethod, .get)

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedQuery))
        XCTAssertTrue(resource.parameters!.contains(expectedLimit))

        XCTAssertNotNil(resource.parse)
    }

    func testSearchWithLimit() {
        let resource = Accounts.search(query: "Ash", limit: 42)

        let expectedQuery = URLQueryItem(name: "q", value: "Ash")
        let expectedLimit = URLQueryItem(name: "limit", value: "42")

        XCTAssertEqual(resource.path, "/api/v1/accounts/search")
        XCTAssertEqual(resource.httpMethod, .get)

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedQuery))
        XCTAssertTrue(resource.parameters!.contains(expectedLimit))

        XCTAssertNotNil(resource.parse)
    }
}
