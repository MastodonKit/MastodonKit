//
//  Decodable.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 12/31/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.mastodonFormatter)
        return try decoder.decode(Self.self, from: data)
    }
}
