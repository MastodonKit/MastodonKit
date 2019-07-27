//
//  PollsTests.swift
//  MastodonKit
//
//  Created by Daniel Nitsikopoulos on 26/7/19.
//

import XCTest
@testable import MastodonKit

class PollsTests: XCTestCase {
    func testPolls() {
        let request = Polls.poll(id: "42")
        
        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/polls/42")
        
        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertNil(request.method.queryItems)
    }
    
    func testVote() {
        let request = Polls.vote(id: "42", choices: ["1"])
        
        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/polls/42/vote")
        
        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)
        
        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 1)
        XCTAssertTrue(payload.contains("choices[]=1"))
    }
}
