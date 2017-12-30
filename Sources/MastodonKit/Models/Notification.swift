//
//  Notification.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Notification: Codable {
    /// The notification ID.
    public let id: String
    /// The notification type.
    public let type: NotificationType
    /// The time the notification was created.
    public let createdAt: Date
    /// The Account sending the notification to the user.
    public let account: Account
    /// The Status associated with the notification, if applicable.
    public let status: Status?

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case createdAt = "created_at"
        case account
        case status
    }
}
