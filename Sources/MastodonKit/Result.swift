//
//  Result.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/6/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value, Pagination?)
    case failure(Error)
}
