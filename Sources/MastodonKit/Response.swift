//
//  Response.swift
//  MastodonKit
//
//  Created by Marcel Voss on 10.11.22.
//  Copyright © 2022 MastodonKit. All rights reserved.
//

import Foundation

public struct Response<Model> {
    public let value: Model
    public let pagination: Pagination?
}
