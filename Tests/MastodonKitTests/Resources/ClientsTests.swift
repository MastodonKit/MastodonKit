import XCTest
@testable import MastodonKit

class ClientsTests: XCTestCase {
    func testRegisterApplication() {
        let resource = Clients.register(clientName: "MastodonKitTestApplication", scopes: [])

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob"))
        XCTAssertTrue(payload.contains("scopes="))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }

    func testRegisterApplicationWithRedirectURI() {
        let resource = Clients.register(clientName: "MastodonKitTestApplication",
                                        redirectURI: "my-awesome-app://", scopes: [.read, .follow])

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=my-awesome-app%3A//"))
        XCTAssertTrue(payload.contains("scopes=read%20follow"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }

    func testRegisterApplicationWithStatusAndWebsite() {
        let resource = Clients.register(clientName: "MastodonKitTestApplication",
                                        scopes: [.read, .write, .follow],
                                        website: "https://github.com/ornithocoder/MastodonKit")

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        let payload = String(data: resource.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob"))
        XCTAssertTrue(payload.contains("scopes=read%20write%20follow"))
        XCTAssertTrue(payload.contains("website=https%3A//github.com/ornithocoder/MastodonKit"))

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<ClientApplication?>.self)
    }
}
