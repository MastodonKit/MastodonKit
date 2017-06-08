//
//  URLRequestTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/28/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class URLRequestTests: XCTestCase {
    func testRequestWithValidHTTPBody() {
        let url = URL(string: "https://mastodon.technology")!
        let mediaData = Data()
        let method = HTTPMethod.post(.media(.gif(mediaData)))
        let request = Request<String>(path: "/string", method: method) { _ in return "string" }

        let urlRequest = URLRequest(url: url, request: request, accessToken: nil)

        XCTAssertEqual(urlRequest.timeoutInterval, 30)
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertNotNil(urlRequest.httpBody)

        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "Authorization"))
        XCTAssertNotNil(urlRequest.value(forHTTPHeaderField: "Content-Type"))
    }

    func testRequestWithoutHTTPBody() {
        let url = URL(string: "https://mastodon.technology")!
        let request = Request<String>(path: "/string", method: HTTPMethod.get(.empty)) { _ in return "string" }

        let urlRequest = URLRequest(url: url, request: request, accessToken: nil)

        XCTAssertEqual(urlRequest.timeoutInterval, 30)
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertNil(urlRequest.httpBody)

        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "Authorization"))
        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "Content-Type"))
    }

    func testRequestWithAccessToken() {
        let url = URL(string: "https://mastodon.technology")!
        let request = Request<String>(path: "/string", method: HTTPMethod.get(.empty)) { _ in return "string" }

        let urlRequest = URLRequest(url: url, request: request, accessToken: "foo")

        XCTAssertEqual(urlRequest.timeoutInterval, 30)
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertNil(urlRequest.httpBody)

        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Authorization"), "Bearer foo")
        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "Content-Type"))
    }
}
