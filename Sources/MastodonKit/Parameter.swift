//
//  Parameter.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/2/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

struct Parameter {
    let name: String
    let value: String?
}

// MARK: - Equatable

extension Parameter: Equatable {
    static func == (lhs: Parameter, rhs: Parameter) -> Bool {
        return lhs.name == rhs.name && lhs.value == rhs.value
    }
}
