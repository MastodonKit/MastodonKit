//
//  Report.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Report: Codable {
    /// The ID of the report.
    public let id: String
    /// The action taken in response to the report.
    public let actionTaken: String

    private enum CodingKeys: String, CodingKey {
        case id
        case actionTaken = "action_taken"
    }
}
