# MastodonKit [![Build Status](https://travis-ci.org/ornithocoder/MastodonKit.svg?branch=master)](https://travis-ci.org/ornithocoder/MastodonKit) [![Code Coverage](http://codecov.io/github/ornithocoder/MastodonKit/branch/master/graphs/badge.svg)](http://codecov.io/github/ornithocoder/MastodonKit)

MastodonKit is a Swift Framework built using Swift Package Manager that wraps the Mastodon API. Its goal is to cover all the entities and endpoints from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md).

By the way, if you want to get in touch with me, [toot me](https://mastodon.technology/@ornithocoder).

## Table of content

- [Building from source](#building-it-from-source)
- [Initializing the client](#initializing-the-client)
- [Making requests](#making-requests)
- [List of resources](#list-of-resources)
    - [Accounts](#accounts)
    - [Clients](#clients)
    - [Blocks](#blocks)
    - [Favourites](#favourites)
    - [Follow Requests](#follow-requests)
    - [Instances](#instances)
    - [Mute](#mute)
    - [Notifications](#notifications)
    - [Reports](#reports)
    - [Search](#search)
    - [Statuses](#statuses)
    - [Timelines](#timelines)
- [License](#license)

## Building it from source

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

Assuming you already have an access token for a user on the given Mastodon instance:

```swift
let client = Client(
    baseURL: "https://mastodon.technology",
    accessToken: "user access token (after OAuth login)"
)
```

Shall you need to get an access token, you must first register the application against the given Mastodon instance. Registering an application returns the Client ID and Client Secret needed to perform the OAuth call. Remember to store the Client ID and Client Secret locally in your application for future OAuth logins:

```swift
let client = Client(baseURL: "https://mastodon.technology")

let resource = Clients.register(
    clientName: "MastodonKit Test Client",
    scopes: [.read, .write, .follow],
    website: "https://github.com/ornithocoder/MastodonKit"
)

client.run(resource) { application, error in
    if let application = application {
        print("id: \(application.id)")
        print("redirect uri: \(application.redirectURI)")
        print("client id: \(application.clientID)")
        print("client secret: \(application.clientSecret)")
    }
}
```

After retrieving the access token (via standard OAuth 2 authorization flow), update the MastodonKit client with the returned accessToken:

```swift
client.accessToken = "user access token (after OAuth login)"
```

**Side note**: Mastodon's API and MastodonKit offer a way to silently log a user in, but the method is discouraged. The [API documentation](https://github.com/tootsuite/documentation/blob/master/Using-the-API/Testing-with-cURL.md) recommends using the standard OAuth 2 authorization flow instead.

> _"Please note that the password-based approach is not recommended especially if you're dealing with other user's accounts and not just your own. Usually you would use the authorization grant approach where you redirect the user to a web page on the original site where they can login and authorize the application and are then redirected back to your application with an access code."_ - Mastodon's API Documentation

But in case you want to test it with your own account, here is how:

```swift
let loginResource = Login.silent(
    clientID: "very long client id",
    clientSecret: "very long client secret",
    scope: .read,
    username: "foo",
    password: "bar")

client.run(loginResource) { loginSettings, error in
    if let loginSettings = loginSettings {
        print("access token: \(loginSettings.accessToken)")
    }
}
```

Bear in mind the method above should never be used when deadling with other user's accounts.

## Making requests

Create a resource and run it using the client.

Getting the home timeline:

```swift
let resource = Timelines.home()

client.run(resource) { statuses, error in
    // do something with 'statuses'
}
```

Posting a new status:

```swift
let resource = Statuses.create("Mastodon's API is awesome!")

client.run(resource) { status, error in
    // do something with 'status'
}
```

## List of resources

Below a list of resources implemented by MastodonKit. All the methods are documented and their descriptions are available via option+click on Xcode.

### Accounts

Fetching an account:

```swift
public struct Accounts {
    public static func account(id: Int) -> AccountResource
}
```

Getting the current user:

```swift
public struct Accounts {
    public static func currentUser() -> AccountResource
}
```

Getting an account's followers:

```swift
public struct Accounts {
    public static func followers(id: Int) -> AccountsResource
}
```

Getting who account is following:

```swift
public struct Accounts {
    public static func following(id: Int) -> AccountsResource
}
```

Getting an account's statuses:

```swift
public struct Accounts {
    public static func statuses(id: Int) -> TimelineResource
}
```

Following an account:

```swift
public struct Accounts {
    public static func follow(id: Int) -> AccountResource
}
```

Unfollowing an account:

```swift
public struct Accounts {
    public static func unfollow(id: Int) -> AccountResource
}
```

Blocking an account:

```swift
public struct Accounts {
    public static func block(id: Int) -> RelationshipResource
}
```

Unblocking an account:

```swift
public struct Accounts {
    public static func unblock(id: Int) -> RelationshipResource
}
```

Muting an account:

```swift
public struct Accounts {
    public static func mute(id: Int) -> RelationshipResource
}
```

Unmuting an account:

```swift
public struct Accounts {
    public static func unmute(id: Int) -> RelationshipResource
}
```

Getting an account's relationships:

```swift
public struct Accounts {
    public static func relationships(ids: [Int]) -> RelationshipsResource
}
```

Searching for accounts:

```swift
public struct Accounts {
    public static func search(query: String, limit: Int = default) -> AccountsResource
}
```

### Clients

Registering an application:

```swift
public struct Clients {
    public static func register(clietName: String,
                                redirectURI: String = default,
                                scopes: [AccessScope],
                                website: String? = default) -> RegisteredApplicationResource
}
```

### Blocks

Fetching a user's blocks:

```swift
public struct Blocks {
    public static func all() -> AccountsResource
}
```

### Favourites

Fetching a user's favourites:

```swift
public struct Favourites {
    public static func all() -> TimelineResource
}
```

### Follow Requests

Fetching a list of follow requests:

```swift
public struct FollowRequests {
    public static func all() -> AccountsResource
}
```

Authorizing a follow request:

```swift
public struct FollowRequests {
    public static func authorize(id: Int) -> AccountResource
}
```

Rejecting a follow request:

```swift
public struct FollowRequests {
    public static func reject(id: Int) -> AccountResource
}
```

### Instances

Getting instance information:

```swift
public struct Instances {
    public static func current() -> InstanceResource
}
```

### Login

Performing a silent login:

```swift
public struct Login {
    public static func silent(clientID: String,
                              clientSecret: String,
                              scope: AccessScope,
                              username: String,
                              password: String) -> LoginSettingsResource
}
```

### Mute

Fetching a user's mute:

```swift
public struct Mutes {
    public static func all() -> AccountsResource
}
```

### Notifications

Fetching a user's notifications:

```swift
public struct Notifications {
    public static func all() -> NotificationsResource
}
```

Getting a single notification:

```swift
public struct Notifications {
    public static func notification(id: Int) -> NotificationResource
}
```

Deleting all notifications for the authenticated use:

```swift
public struct Notifications {
    public static func dismissAll() -> NotificationResource
}
```

Deleting a single notification for the authenticated user:

```swift
public struct Notifications {
    public static func dismiss(id: Int) -> NotificationResource
}
```

### Reports

Fetching a user's reports:

```swift
public struct Reports {
    public static func all() -> ReportsResource
}
```

Reporting a user:

```swift
public struct Reports {
    public static func report(accountID: Int, statusIDs: [Int], reason: String) -> ReportResource
}
```

### Search

Searching for content:

```swift
public struct Search {
    public static func search(query: String, resolve: Bool = default) -> ResultsResource
}
```

### Statuses

Fetching a status:

```swift
public struct Statuses {
    public static func status(id: Int) -> StatusResource
}
```

Getting a status context:

```swift
public struct Statuses {
    public static func context(id: Int) -> ContextResource
}
```

Getting a card associated with a status:

```swift
public struct Statuses {
    public static func card(id: Int) -> CardResource
}
```

Getting who reblogged a status:

```swift
public struct Statuses {
    public static func rebloggedBy(id: Int) -> AccountsResource
}
```

Getting who favourited a status:

```swift
public struct Statuses {
    public static func favouritedBy(id: Int) -> AccountsResource
}
```

Posting a new status:

```swift
public struct Statuses {
    public static func create(status: String,
                              replyToID: Int? = default,
                              mediaIDs: [Int] = default,
                              sensitive: Bool? = default,
                              spoilerText: String? = default,
                              visibility: VisibilityType = default) -> StatusResource
}
```

Deleting a status:

```swift
public struct Statuses {
    public static func delete(id: Int) -> StatusResource
}
```

Reblogging a status:

```swift
public struct Statuses {
    public static func reblog(id: Int) -> StatusResource
}
```

Unreblogging a status:

```swift
public struct Statuses {
    public static func unreblog(id: Int) -> StatusResource
}
```

Favouriting a status:

```swift
public struct Statuses {
    public static func favourite(id: Int) -> StatusResource
}
```

Unfavouriting a status:

```swift
public struct Statuses {
    public static func unfavourite(id: Int) -> StatusResource
}
```

### Timelines

Retrieving the home timeline:

```swift
public struct Timelines {
    public static func home() -> TimelineResource
}
```

Retrieving the public timeline:

```swift
public struct Timelines {
    public static func `public`(local: Bool? = default) -> TimelineResource
}
```

Retrieving a tag timeline:

```swift
public struct Timelines {
    public static func tag(_ hashtag: String, local: Bool? = default) -> TimelineResource
}
```

# License

Copyright (c) 2017 Ornithologist Coder and MastodonKit Contributors. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
