import XCTest
@testable import MastodonKit

class ClientsTests: XCTestCase {
    func testRegisterApplication() {
        let resource = Clients.registerClient(name: "MastodonKitTestApplication", scopes: [])

        let expectedClientName = URLQueryItem(name: "client_name", value: "MastodonKitTestApplication")
        let expectedRedirectURI = URLQueryItem(name: "redirect_uris", value: "urn:ietf:wg:oauth:2.0:oob")
        let expectedScopes = URLQueryItem(name: "scopes", value: "")

        XCTAssertEqual(resource.path, "/api/v1/apps")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters!.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedClientName))
        XCTAssertTrue(resource.parameters!.contains(expectedRedirectURI))
        XCTAssertTrue(resource.parameters!.contains(expectedScopes))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }

    func testRegisterApplicationWithRedirectURI() {
        let resource = Clients.registerClient(name: "MastodonKitTestApplication", redirectURI: "my-awesome-app://", scopes: [.read, .follow])

        let expectedClientName = URLQueryItem(name: "client_name", value: "MastodonKitTestApplication")
        let expectedRedirectURI = URLQueryItem(name: "redirect_uris", value: "my-awesome-app://")
        let expectedScopes = URLQueryItem(name: "scopes", value: "read+follow")

        XCTAssertEqual(resource.path, "/api/v1/apps")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters!.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedClientName))
        XCTAssertTrue(resource.parameters!.contains(expectedRedirectURI))
        XCTAssertTrue(resource.parameters!.contains(expectedScopes))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }

    func testRegisterApplicationWithStatusAndWebsite() {
        let resource = Clients.registerClient(name: "MastodonKitTestApplication", scopes: [.read, .write, .follow], website: "https://github.com/ornithocoder/MastodonKit")

        let expectedClientName = URLQueryItem(name: "client_name", value: "MastodonKitTestApplication")
        let expectedRedirectURI = URLQueryItem(name: "redirect_uris", value: "urn:ietf:wg:oauth:2.0:oob")
        let expectedScopes = URLQueryItem(name: "scopes", value: "read+write+follow")
        let expectedWebsite = URLQueryItem(name: "website", value: "https://github.com/ornithocoder/MastodonKit")

        XCTAssertEqual(resource.path, "/api/v1/apps")
        XCTAssertEqual(resource.httpMethod, .post)

        XCTAssertEqual(resource.parameters!.count, 4)
        XCTAssertTrue(resource.parameters!.contains(expectedClientName))
        XCTAssertTrue(resource.parameters!.contains(expectedRedirectURI))
        XCTAssertTrue(resource.parameters!.contains(expectedScopes))
        XCTAssertTrue(resource.parameters!.contains(expectedWebsite))

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }
}
