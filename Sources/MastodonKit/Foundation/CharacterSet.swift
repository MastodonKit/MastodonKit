//
//  CharacterSet.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/4/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

extension CharacterSet {
    static let bodyAllowed: CharacterSet = {
        return CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~/?")
    }()
}
