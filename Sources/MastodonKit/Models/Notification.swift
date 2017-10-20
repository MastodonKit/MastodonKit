//
//  Notification.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Notification {
    /// The notification ID.
    public let id: Int
    /// The notification type.
    public let type: NotificationType
    /// The time the notification was created.
    public let createdAt: Date
    /// The Account sending the notification to the user.
    public let account: Account
    /// The Status associated with the notification, if applicable.
    public let status: Status?
}

extension Notification: JSONDictionaryInitializable {
    init?(from dictionary: JSONDictionary) {
        guard
            let id = dictionary["id"] as? String,
            let intID = Int(id),
            let typeString = dictionary["type"] as? String,
            let type = NotificationType(rawValue: typeString),
            let createdAtString = dictionary["created_at"] as? String,
            let createdAt = DateFormatter.mastodonFormatter.date(from: createdAtString),
            let accountDictionary = dictionary["account"] as? JSONDictionary,
            let account = Account(from: accountDictionary)
            else {
                return nil
        }

        self.id = intID
        self.type = type
        self.createdAt = createdAt
        self.account = account
        self.status = dictionary["status"].flatMap(asJSONDictionary).flatMap(Status.init)
    }
}
