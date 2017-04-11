# MastodonKit

MastodonKit is a Swift Framework that wraps Mastodon API. Currently, it's a work in progress but the goal is to cover all the entities and endpoints from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md).

Please note there's a lot to do before MastodonKit can be used in production code.

## Building from Source

```
$ git clone https://github.com/ornithocoder/MastodonKit.git
$ cd MastodonKit
$ swift build
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
let resource = Timelines.home()

client.get(resource) { statuses in
    // do something with 'statuses'
}
```

The following resources are already implemented or under development:

```swift
public struct Accounts {
    public static func account(id: Int) -> AccountResource
    public static func currentUser() -> AccountResource
    public static func followers(id: Int) -> AccountsResource
    public static func following(id: Int) -> AccountsResource
    public static func statuses(id: Int) -> TimelineResource
    public static func follow(id: Int) -> AccountResource
    public static func unfollow(id: Int) -> AccountResource
    public static func block(id: Int) -> AccountResource
    public static func unblock(id: Int) -> AccountResource
    public static func mute(id: Int) -> AccountResource
    public static func unmute(id: Int) -> AccountResource
    public static func search(query: String, limit: Int = 40) -> AccountsResource
}

public struct Blocks {
    public static func all() -> AccountsResource
}

public struct Favourites {
    public static func all() -> TimelineResource
}

public struct FollowRequests {
    public static func all() -> AccountsResource
}

public struct Instances {
    public static func current() -> InstanceResource
}

public struct Mutes {
    public static func all() -> AccountsResource
}

public struct Notifications {
    public static func all() -> NotificationsResource
    public static func notification(id: Int) -> NotificationResource
}

public struct Reports {
    public static func all() -> ReportsResource
}

public struct Search {
    public static func search(query: String, resolve: Bool = false) -> ResultsResource
}

public struct Statuses {
    public static func status(id: Int) -> StatusResource
    public static func context(id: Int) -> ContextResource
    public static func card(id: Int) -> CardResource
    public static func rebloggedBy(id: Int) -> AccountsResource
    public static func favouritedBy(id: Int) -> AccountsResource
}

public struct Timelines {
    public static func home() -> TimelineResource
    public static func `public`() -> TimelineResource
    public static func tag(hashtag: String) -> TimelineResource
}
```

# License

Copyright (c) 2017 Ornithologist Coder. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.