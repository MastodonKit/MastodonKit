//
//  RequestRange.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/3/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum RequestRange {
    /// Gets a list with IDs less than or equal this value.
    case max(id: String, limit: Int?)
    /// Gets a list with IDs greater than this value.
    case since(id: String, limit: Int?)
    /// Sets the maximum number of entities to get.
    case limit(Int)
    /// Applies the default values.
    case `default`
}

extension RequestRange {
    func parameters(limit limitFunction: (Int) -> Int) -> [Parameter]? {
        switch self {
        case .max(let id, let limit):
            return [
                Parameter(name: "max_id", value: id),
                Parameter(name: "limit", value: limit.flatMap(limitFunction).flatMap(toOptionalString))
            ]
        case .since(let id, let limit):
            return [
                Parameter(name: "since_id", value: id),
                Parameter(name: "limit", value: limit.flatMap(limitFunction).flatMap(toOptionalString))
            ]
        case .limit(let limit):
            return [Parameter(name: "limit", value: String(limitFunction(limit)))]
        default:
            return nil
        }
    }
}

// MARK: - Equatable

extension RequestRange: Equatable {
    public static func == (lhs: RequestRange, rhs: RequestRange) -> Bool {
        switch (lhs, rhs) {
        case (.max(let leftID, let leftLimit), .max(let rightID, let rightLimit)):
            return leftID == rightID && leftLimit == rightLimit
        case (.since(let leftID, let leftLimit), .since(let rightID, let rightLimit)):
            return leftID == rightID && leftLimit == rightLimit
        case (.limit(let leftLimit), .limit(let rightLimit)):
            return leftLimit == rightLimit
        case (.default, .default):
            return true
        default:
            return false
        }
    }
}
