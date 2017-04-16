# MastodonKit [![Build Status](https://travis-ci.org/ornithocoder/MastodonKit.svg?branch=master)](https://travis-ci.org/ornithocoder/MastodonKit)

MastodonKit is a Swift Framework that wraps the Mastodon API. Currently, it's a _work in progress_ but the goal is to cover all the entities and endpoints from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md).

Please note there's a lot to do before MastodonKit can be used in production code.

## Building from source

MastodonKit uses the Swift Package Manager and can be built and tested using the following commands:

```
$ git clone https://github.com/ornithocoder/MastodonKit.git
$ cd MastodonKit
$ swift build
$ swift test
```

If you prefer, Swift Package Manager can create an Xcode Project:

```
$ swift package generate-xcodeproj
$ open MastodonKit.xcodeproj
```

## Initializing the client

```swift
let client = MastodonClient(
    baseURL: "https://mastodon.technology",
    accessToken: "user access token (after OAuth login)"
)
```

## Making requests

```swift
// Getting the home timeline

let resource = Timelines.home()

client.run(resource) { statuses in
    // do something with 'statuses'
}

// Posting a new status

let resource = Statuses.create("Mastodon's API is awesome!")

client.run(resource) { status in
    // do something with 'status'
}
```

## Methods

### Accounts

```swift
public struct Accounts {
    /// Fetches an account.
    public static func account(id: Int) -> AccountResource

    /// Gets the current user.
    public static func currentUser() -> AccountResource

    /// Gets an account's followers.
    public static func followers(id: Int) -> AccountsResource

    /// Gets who account is following.
    public static func following(id: Int) -> AccountsResource

    /// Gets an account's statuses.
    public static func statuses(id: Int) -> TimelineResource

    /// Follows an account.
    public static func follow(id: Int) -> AccountResource

    /// Unfollow an account.
    public static func unfollow(id: Int) -> AccountResource

    /// Blocks an account.
    public static func block(id: Int) -> RelationshipResource

    /// Unblocks an account.
    public static func unblock(id: Int) -> RelationshipResource

    /// Mutes an account.
    public static func mute(id: Int) -> RelationshipResource

    /// Unmutes an account.
    public static func unmute(id: Int) -> RelationshipResource

    /// Gets an account's relationships.
    public static func relationships(id: Int) -> RelationshipsResource

    /// Searches for accounts.
    public static func search(query: String, limit: Int = default) -> AccountsResource
}
```

### Blocks

```swift
public struct Blocks {
    /// Fetches a user's blocks.
    public static func all() -> AccountsResource
}
```

### Favourites

```swift
public struct Favourites {
    /// Fetches a user's favourites.
    public static func all() -> TimelineResource
}
```

### Follow Requests

```swift
public struct FollowRequests {
    /// Fetches a list of follow requests.
    public static func all() -> AccountsResource

    /// Authorizes a follow request.
    public static func authorize(id: Int) -> AccountResource

    /// Rejects a follow request.
    public static func reject(id: Int) -> AccountResource
}
```

### Instances

```swift
public struct Instances {
    /// Gets instance information.
    public static func current() -> InstanceResource
}
```

### Mute

```swift
public struct Mutes {
    /// Fetches a user's mutes.
    public static func all() -> AccountsResource
}
```

### Notifications

```swift
public struct Notifications {
    /// Fetches a user's notifications.
    public static func all() -> NotificationsResource

    /// Gets a single notification.
    public static func notification(id: Int) -> NotificationResource
}
```

### Reports

```swift
public struct Reports {
    /// Fetches a user's reports.
    public static func all() -> ReportsResource

    /// Reports a user.
    public static func report(accountID: Int, statusID: Int, reason: String) -> ReportResource
}
```

### Search

```swift
public struct Search {
    /// Searches for content.
    public static func search(query: String, resolve: Bool = default) -> ResultsResource
}
```

### Statuses

```swift
public struct Statuses {
    /// Fetches a status.
    public static func status(id: Int) -> StatusResource

    /// Gets a status context.
    public static func context(id: Int) -> ContextResource

    /// Gets a card associated with a status.
    public static func card(id: Int) -> CardResource

    /// Gets who reblogged a status.
    public static func rebloggedBy(id: Int) -> AccountsResource

    /// Gets who favourited a status.
    public static func favouritedBy(id: Int) -> AccountsResource

    /// Posts a new status.
    public static func create(status: String,
                              replyToID: Int? = default,
                              sensitive: Bool? = default,
                              spoilerText: String? = default,
                              visibility: VisibilityType = default) -> StatusResource

    /// Deletes a status.
    public static func delete(id: Int) -> StatusResource

    /// Reblogs a status.
    public static func reblog(id: Int) -> StatusResource

    /// Unreblogs a status.
    public static func unreblog(id: Int) -> StatusResource

    /// Favourites a status.
    public static func favourite(id: Int) -> StatusResource

    /// Unfavourites a status.
    public static func unfavourite(id: Int) -> StatusResource
}
```

### Timelines

```swift
public struct Timelines {
    /// Retrieves the home timeline.
    public static func home() -> TimelineResource

    /// Retrieves the public timeline.
    public static func `public`() -> TimelineResource

    /// Retrieves a tag timeline.
    public static func tag(_ hashtag: String) -> TimelineResource
}
```

# License

Copyright (c) 2017 Ornithologist Coder and MastodonKit Contributors. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
