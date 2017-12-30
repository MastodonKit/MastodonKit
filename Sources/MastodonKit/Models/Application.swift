//
//  Application.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Application: Codable {
    /// Name of the app.
    public let name: String
    /// Homepage URL of the app.
    public let website: String?
}
