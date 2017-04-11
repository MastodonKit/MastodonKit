import XCTest
@testable import MastodonKit

class TimelinesTeSearchTestssts: XCTestCase {
    static var allTests = [
        ("testSearchWithoutResolve", testSearchWithoutResolve),
        ("testSearchWithResolve", testSearchWithResolve)
    ]

    func testSearchWithoutResolve() {
        let resource = Search.search(query: "mastodonkit")

        XCTAssertEqual(resource.path, "/api/v1/search")
        XCTAssertEqual(resource.parameters?.first?.name, "q")
        XCTAssertEqual(resource.parameters?.first?.value, "mastodonkit")
        XCTAssertEqual(resource.parameters?.last?.name, "resolve")
        XCTAssertEqual(resource.parameters?.last?.value, "false")
        XCTAssertNotNil(resource.parse)
    }

    func testSearchWithResolve() {
        let resource = Search.search(query: "mastodonkit", resolve: true)

        XCTAssertEqual(resource.path, "/api/v1/search")
        XCTAssertEqual(resource.parameters?.first?.name, "q")
        XCTAssertEqual(resource.parameters?.first?.value, "mastodonkit")
        XCTAssertEqual(resource.parameters?.last?.name, "resolve")
        XCTAssertEqual(resource.parameters?.last?.value, "true")
        XCTAssertNotNil(resource.parse)
    }
}

