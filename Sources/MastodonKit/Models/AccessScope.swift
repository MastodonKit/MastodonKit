//
//  AccessScope.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum AccessScope: String {
    /// Allows reading data.
    case read
    /// Allows posting statuses and uploading media for statuses.
    case write
    /// Allows following, unfollowing, blocking, and unblocking users.
    case follow
}
