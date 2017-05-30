//
//  URLSessionDataTaskFake.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

class URLSessionDataTaskFake: URLSessionDataTask {
    var didCallResume = false

    override func resume() {
        didCallResume = true
    }
}
