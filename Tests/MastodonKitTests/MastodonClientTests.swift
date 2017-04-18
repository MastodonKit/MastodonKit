import XCTest
@testable import MastodonKit

class MastodonClientTests: XCTestCase {
    func testMastodonClientInitializationWithAccessToken() {
        let client = MastodonClient(baseURL: "https://my.mastodon.instance/", accessToken: "foo")

        XCTAssertNotNil(client)
    }

    func testMastodonClientInitializationWithoutAccessToken() {
        let client = MastodonClient(baseURL: "https://my.mastodon.instance/")

        XCTAssertNotNil(client)
    }

    func testMastodonClientAccessTokenConfiguration() {
        let client = MastodonClient(baseURL: "https://my.mastodon.instance/")

        XCTAssertNil(client.accessToken)
        client.accessToken = "bar"
        XCTAssertEqual(client.accessToken, "bar")
    }
}
