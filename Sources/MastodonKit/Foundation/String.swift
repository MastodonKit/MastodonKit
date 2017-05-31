//
//  String.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/31/17.
//  Copyright (c) 2017 MastodonKit. All rights reserved.
//

import Foundation

extension String {
    public func condensed(separator: String = "") -> String {
        let components = self.components(separatedBy: .whitespaces)
        return components.filter { !$0.isEmpty }.joined(separator: separator)
    }
}
