//
//  URLSessionDataTaskFake.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

class URLSessionDataTaskFake: URLSessionDataTask {
    var didCallResume = false

    override func resume() {
        didCallResume = true
    }
}
