//
//  Pagination.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/1/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Pagination {
    /// The request range for fetching the next page.
    public let next: RequestRange?
    /// The request range for fetching the previous page.
    public let previous: RequestRange?
}

extension Pagination {
    init(string: String) {
        let links = string
            .components(separatedBy: ",")
            .compactMap(PaginationItem.init)

        var nextLink: RequestRange?
        var previousLink: RequestRange?

        for link in links {
            switch link.type {
            case .next: nextLink = .max(id: link.id, limit: link.limit)
            case .prev: previousLink = .since(id: link.id, limit: link.limit)
            }
        }

        self.next = nextLink
        self.previous = previousLink
    }
}

// MARK: - Equatable

extension Pagination: Equatable {
    public static func == (lhs: Pagination, rhs: Pagination) -> Bool {
        guard lhs.next == rhs.next, lhs.previous == rhs.previous else { return false }
        return true
    }
}
