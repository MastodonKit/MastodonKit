//
//  Link.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/31/17.
//  Copyright (c) 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Link {
    enum LinkType: String {
        case next, prev
    }

    let type: LinkType
    let id: Int
    let limit: Int?
}

extension Link {
    init?(string: String) {
        let segments = string
            .replacingOccurrences(of: " ", with: "")
            .components(separatedBy: ";")

        let url = segments.first.flatMap(trim(left: "<", right: ">"))
        let rel = segments.last?
            .replacingOccurrences(of: "\"", with: "")
            .trimmingCharacters(in: .whitespaces)
            .components(separatedBy: "=")

        guard
            let validURL = url,
            let referenceKey = rel?.first, referenceKey == "rel",
            let referenceValue = rel?.last,
            let type = LinkType(rawValue: referenceValue),
            let queryItems = URLComponents(string: validURL)?.queryItems
            else {
                return nil
        }

        let sinceID = queryItems
            .first { $0.name == "since_id" }
            .flatMap(toInteger)

        let maxID = queryItems
            .first { $0.name == "max_id" }
            .flatMap(toInteger)

        guard let id = maxID ?? sinceID else { return nil }

        self.type = type
        self.id = id
        self.limit = queryItems
            .first { $0.name == "limit" }
            .flatMap(toInteger)
    }
}
