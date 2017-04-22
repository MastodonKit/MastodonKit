# MastodonKit [![Build Status](https://travis-ci.org/ornithocoder/MastodonKit.svg?branch=master)](https://travis-ci.org/ornithocoder/MastodonKit) [![Code Coverage](http://codecov.io/github/ornithocoder/MastodonKit/branch/master/graphs/badge.svg)](http://codecov.io/github/ornithocoder/MastodonKit)

MastodonKit is a Swift Framework that wraps the Mastodon API. Its goal is to cover all the entities and endpoints from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md).

## Table of content

- [Building from source](#building-from-source)
- [Initializing the client](#initializing-the-client)
- [Making requests](#making-requests)
- [List of resources](#list-of-resources)
    - [Accounts](#accounts)
    - [Applications](#applications)
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

Assuming that you already have an access token for a user on the given Mastodon instance:

```swift
let client = Client(
    baseURL: "https://mastodon.technology",
    accessToken: "user access token (after OAuth login)"
)
```

If you need to get an access token, you must first register the application against the given Mastodon instance. Registering an application returns the Client ID and Client Secret needed to perform the OAuth call. Remember to store the Client ID and Client Secret locally in your application for future OAuth logins:

```swift
let client = Client(baseURL: "https://mastodon.technology")

let resource = Applications.registerClient(
    name: "MastodonKit Test Client",
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

**Side note**: Mastodon's API and MastodonKit offer a way to silently log a user in, but the method is discouraged since the [API documentation](https://github.com/tootsuite/documentation/blob/master/Using-the-API/Testing-with-cURL.md) recommends using the standard OAuth 2 authorization flow.

> _"Please note that the password-based approach is not recommended especially if you're dealing with other user's accounts and not just your own. Usually you would use the authorization grant approach where you redirect the user to a web page on the original site where they can login and authorize the application and are then redirected back to your application with an access code."_ - Mastodon's API Documentation

In case you want to test it with your own account, here is how:

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

But bear in mind the method above should never be used when deadling with other user's accounts.

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

Below a list of resources implemented by MastodonKit. All the methods are documented and their descriptions are available via option+click on Xcode:

![documentation](https://cloud.githubusercontent.com/assets/19753339/25175832/83191756-24fc-11e7-9ca8-8f63e0c76b3c.png)

### Accounts

Fetches an account:

```swift
public struct Accounts {
    public static func account(id: Int) -> AccountResource
}
```

Gets the current user:

```swift
public struct Accounts {
    public static func currentUser() -> AccountResource
}
```

Gets an account's followers:

```swift
public struct Accounts {
    public static func followers(id: Int) -> AccountsResource
}
```

Gets who account is following:

```swift
public struct Accounts {
    public static func following(id: Int) -> AccountsResource
}
```

Gets an account's statuses:

```swift
public struct Accounts {
    public static func statuses(id: Int) -> TimelineResource
}
```

Follows an account:

```swift
public struct Accounts {
    public static func follow(id: Int) -> AccountResource
}
```

Unfollow an account:

```swift
public struct Accounts {
    public static func unfollow(id: Int) -> AccountResource
}
```

Blocks an account:

```swift
public struct Accounts {
    public static func block(id: Int) -> RelationshipResource
}
```

Unblocks an account:

```swift
public struct Accounts {
    public static func unblock(id: Int) -> RelationshipResource
}
```

Mutes an account:

```swift
public struct Accounts {
    public static func mute(id: Int) -> RelationshipResource
}
```

Unmutes an account:

```swift
public struct Accounts {
    public static func unmute(id: Int) -> RelationshipResource
}
```

Gets an account's relationships:

```swift
public struct Accounts {
    public static func relationships(id: Int) -> RelationshipsResource
}
```

Searches for accounts:

```swift
public struct Accounts {
    public static func search(query: String, limit: Int = default) -> AccountsResource
}
```

### Applications

Registers an application:

```swift
public struct Applications {
    public static func registerClient(name: String,
                                      redirectURI: String = default,
                                      scopes: [AccessScope],
                                      website: String? = default) -> RegisteredApplicationResource
}
```

### Blocks

Fetches a user's blocks:

```swift
public struct Blocks {
    public static func all() -> AccountsResource
}
```

### Favourites

Fetches a user's favourites:

```swift
public struct Favourites {
    public static func all() -> TimelineResource
}
```

### Follow Requests

Fetches a list of follow requests:

```swift
public struct FollowRequests {
    public static func all() -> AccountsResource
}
```

Authorizes a follow request:

```swift
public struct FollowRequests {
    public static func authorize(id: Int) -> AccountResource
}
```

Rejects a follow request:

```swift
public struct FollowRequests {
    public static func reject(id: Int) -> AccountResource
}
```

### Instances

Gets instance information:

```swift
public struct Instances {
    public static func current() -> InstanceResource
}
```

### Mute

Fetches a user's mute:

```swift
public struct Mutes {
    public static func all() -> AccountsResource
}
```

### Notifications

Fetches a user's notifications:

```swift
public struct Notifications {
    public static func all() -> NotificationsResource
}
```

Gets a single notification:

```swift
public struct Notifications {
    public static func notification(id: Int) -> NotificationResource
}
```

### Reports

Fetches a user's reports:

```swift
public struct Reports {
    public static func all() -> ReportsResource
}
```

Reports a user:

```swift
public struct Reports {
    public static func report(accountID: Int, statusID: Int, reason: String) -> ReportResource
}
```

### Search

Searches for content:

```swift
public struct Search {
    public static func search(query: String, resolve: Bool = default) -> ResultsResource
}
```

### Statuses

Fetches a status:

```swift
public struct Statuses {
    public static func status(id: Int) -> StatusResource
}
```

Gets a status context:

```swift
public struct Statuses {
    public static func context(id: Int) -> ContextResource
}
```

Gets a card associated with a status:

```swift
public struct Statuses {
    public static func card(id: Int) -> CardResource
}
```

Gets who reblogged a status:

```swift
public struct Statuses {
    public static func rebloggedBy(id: Int) -> AccountsResource
}
```

Gets who favourited a status:

```swift
public struct Statuses {
    public static func favouritedBy(id: Int) -> AccountsResource
}
```

Posts a new status:

```swift
public struct Statuses {
    public static func create(status: String,
                              replyToID: Int? = default,
                              sensitive: Bool? = default,
                              spoilerText: String? = default,
                              visibility: VisibilityType = default) -> StatusResource
}
```

Deletes a status:

```swift
public struct Statuses {
    public static func delete(id: Int) -> StatusResource
}
```

Reblogs a status:

```swift
public struct Statuses {
    public static func reblog(id: Int) -> StatusResource
}
```

Unreblogs a status:

```swift
public struct Statuses {
    public static func unreblog(id: Int) -> StatusResource
}
```

Favourites a status:

```swift
public struct Statuses {
    public static func favourite(id: Int) -> StatusResource
}
```

Unfavourites a status:

```swift
public struct Statuses {
    public static func unfavourite(id: Int) -> StatusResource
}
```

### Timelines

Retrieves the home timeline:

```swift
public struct Timelines {
    public static func home() -> TimelineResource
}
```

Retrieves the public timeline:

```swift
public struct Timelines {
    public static func `public`() -> TimelineResource
}
```

Retrieves a tag timeline:

```swift
public struct Timelines {
    public static func tag(_ hashtag: String) -> TimelineResource
}
```

# License

Copyright (c) 2017 Ornithologist Coder and MastodonKit Contributors. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
