//
//  ClientsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ClientsTests: XCTestCase {
    func testRegisterApplication() {
        let request = Clients.register(clientName: "MastodonKitTestApplication", scopes: [])

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob"))
        XCTAssertTrue(payload.contains("scopes="))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<ClientApplication>.self)
    }

    func testRegisterApplicationWithRedirectURI() {
        let request = Clients.register(clientName: "MastodonKitTestApplication", redirectURI: "my-awesome-app://", scopes: [.read, .follow])

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 3)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=my-awesome-app%3A//"))
        XCTAssertTrue(payload.contains("scopes=read%20follow"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<ClientApplication>.self)
    }

    func testRegisterApplicationWithStatusAndWebsite() {
        let request = Clients.register(clientName: "MastodonKitTestApplication", scopes: [.read, .write, .follow], website: "https://github.com/ornithocoder/MastodonKit")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/apps")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertTrue(payload.contains("client_name=MastodonKitTestApplication"))
        XCTAssertTrue(payload.contains("redirect_uris=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob"))
        XCTAssertTrue(payload.contains("scopes=read%20write%20follow"))
        XCTAssertTrue(payload.contains("website=https%3A//github.com/ornithocoder/MastodonKit"))

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<ClientApplication>.self)
    }
}
