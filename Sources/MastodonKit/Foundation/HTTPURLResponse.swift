//
//  HTTPURLResponse.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/1/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var pagination: Pagination? {
        return allHeaderFields["Link"].flatMap { $0 as? String }.flatMap(Pagination.init)
    }
}
