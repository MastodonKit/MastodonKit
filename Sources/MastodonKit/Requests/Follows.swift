//
//  Follows.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 1/1/18.
//  Copyright © 2018 MastodonKit. All rights reserved.
//

import Foundation

public struct Follows {
    /// Following a remote user:.
    ///
    /// - Parameter uri: The 'username@domain' of the person you want to follow.
    /// - Returns: Request for `Account`.
    public static func follows(uri: String) -> Request<Account> {
        let parameter = [
            Parameter(name: "uri", value: uri)
        ]

        return Request<Account>(path: "/api/v1/follows", method: .post(.parameters(parameter)))
    }
}
