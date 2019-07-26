//
//  Polls.swift
//  MastodonKit
//
//  Created by Daniel Nitsikopoulos on 26/7/19.
//

import Foundation

/// `Polls` requests.
public enum Polls {
    /// Fetches a poll.
    ///
    /// - Parameter id: The poll id.
    /// - Returns: Request for `Poll`.
    public static func poll(id: String) -> Request<Poll> {
        return Request<Poll>(path: "/api/v1/polls/\(id)")
    }
    
    /// Votes on a poll.
    ///
    /// - Parameters:
    ///   - choices: Array of choice indices.
    /// - Returns: Request for `Poll`.
    public static func vote(id: String,
                              choices: [String] = []) -> Request<Poll> {
        
        let parameters = choices.map(toArrayOfParameters(withName: "choices"))
        
        let method = HTTPMethod.post(.parameters(parameters))
        return Request<Poll>(path: "/api/v1/polls/\(id)/vote", method: method)
    }
}
