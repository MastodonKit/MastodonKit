import XCTest
@testable import MastodonKit

class ClientsTests: XCTestCase {
    func testRegisterApplication() {
        let resource = Clients.register(clientName: "MastodonKitTestApplication", scopes: [])

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=urn:ietf:wg:oauth:2.0:oob"))
        XCTAssertTrue(payload.contains("scopes="))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }

    func testRegisterApplicationWithRedirectURI() {
        let resource = Clients.register(clientName: "MastodonKitTestApplication", redirectURI: "my-awesome-app://", scopes: [.read, .follow])

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=my-awesome-app://"))
        XCTAssertTrue(payload.contains("scopes=read+follow"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }

    func testRegisterApplicationWithStatusAndWebsite() {
        let resource = Clients.register(clientName: "MastodonKitTestApplication", scopes: [.read, .write, .follow], website: "https://github.com/ornithocoder/MastodonKit")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(resource.httpMethod.name, "POST")
        XCTAssertNil(resource.httpMethod.queryItems)
        XCTAssertNotNil(resource.httpMethod.httpBody)

        let payload = String(data: resource.httpMethod.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=urn:ietf:wg:oauth:2.0:oob"))
        XCTAssertTrue(payload.contains("scopes=read+write+follow"))
        XCTAssertTrue(payload.contains("website=https://github.com/ornithocoder/MastodonKit"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }
}
