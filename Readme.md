# MastodonKit [![Build Status](https://travis-ci.org/ornithocoder/MastodonKit.svg?branch=master)](https://travis-ci.org/ornithocoder/MastodonKit) [![Code Coverage](http://codecov.io/github/ornithocoder/MastodonKit/branch/master/graphs/badge.svg)](http://codecov.io/github/ornithocoder/MastodonKit)

MastodonKit is a Swift Framework built using Swift Package Manager that wraps the Mastodon API. Its goal is to cover all the entities and endpoints from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md).

By the way, if you want to get in touch with me, [toot me](https://mastodon.technology/@ornithocoder).

## Table of content

- [Building it from source](#building-it-from-source)
- [Initializing the client](#initializing-the-client)
- [Making requests](#making-requests)
- [List of resources](#list-of-resources)
    - [Accounts](#accounts)
    - [Blocks](#blocks)
    - [Clients](#clients)
    - [Favourites](#favourites)
    - [Follow Requests](#follow-requests)
    - [Instances](#instances)
    - [Mute](#mute)
    - [Notifications](#notifications)
    - [Reports](#reports)
    - [Search](#search)
    - [Statuses](#statuses)
    - [Timelines](#timelines)
- [Contributors](#contributors)
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

To make requests, create a resource and *run* it using the client. Two examples:

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

Below the qualified symbol name for the resources implemented by MastodonKit. All the methods are documented and their descriptions are available via option+click on Xcode.

### Accounts

* ``Accounts.account(id:)`` - fetches an account.
* ``Accounts.currentUser()`` - gets the current user.
* ``Accounts.updateCurrentUser(displayName:note:avatar:header:)`` - updates the current user.
* ``Accounts.followers(id:range:)`` - gets an account's followers.
* ``Accounts.following(id:range:)`` - gets who account is following.
* ``Accounts.statuses(id:mediaOnly:excludeReplies:range:)`` - gets an account's statuses.
* ``Accounts.follow(id:)`` - follows an account.
* ``Accounts.unfollow(id:)`` - unfollow an account.
* ``Accounts.block(id:)`` - blocks an account.
* ``Accounts.unblock(id:)`` - unblocks an account.
* ``Accounts.mute(id:)`` - mutes an account.
* ``Accounts.unmute(id:)`` - unmutes an account.
* ``Accounts.relationships(ids:)`` - gets an account's relationships.
* ``Accounts.search(query:limit:)`` - searches for accounts.

### Blocks

* ``Blocks.all(range:)`` - fetches a user's blocks.

### Clients

* ``Clients.register(clientName:redirectURI:scopes:website:)`` - registers an application.

### Favourites

* ``Favourites.all(range:)`` - fetches a user's favourites.

### Follow Requests

* ``FollowRequests.all(range:)`` - fetches a list of follow requests.
* ``FollowRequests.authorize(id:)`` - authorizes a follow request.
* ``FollowRequests.reject(id:)`` - rejects a follow request.

### Instances

* ``Instances.current()`` - gets instance information.

### Login

* ``Login.silent(clientID:clientSecret:scope:username:password:)`` - performs a silent login.

### Mutes

* ``Mutes.all(range:)`` - fetches a user's mute:

### Notifications

* ``Notifications.all(range:)`` - fetches a user's notifications.
* ``Notifications.notification(id:)`` - gets a single notification.
* ``Notifications.dismissAll()`` - deletes all notifications for the authenticated user.
* ``Notifications.dismiss(id:)`` - deletes a single notification for the authenticated user.

### Reports

* ``Reports.all()`` - fetches a user's reports.
* ``Reports.report(accountID:statusIDs:reason:)`` - reports a user.

### Search

* ``Search.search(query:resolve:)`` - searches for content.

### Statuses

* ``Statuses.status(id:)`` - fetches a status.
* ``Statuses.context(id:)`` - gets a status context.
* ``Statuses.card(id:)`` - gets a card associated with a status.
* ``Statuses.rebloggedBy(id:range:)`` - gets who reblogged a status.
* ``Statuses.favouritedBy(id:range:)`` - gets who favourited a status.
* ``Statuses.create(status:replyToID:mediaIDs:sensitive:spoilerText:visibility:)`` - posts a new status.
* ``Statuses.delete(id:)`` - deletes a status.
* ``Statuses.reblog(id:)`` - reblogs a status.
* ``Statuses.unreblog(id:)`` - unreblogs a status.
* ``Statuses.favourite(id:)`` - favourites a status.
* ``Statuses.unfavourite(id:)`` - unfavourites a status.

### Timelines

* ``Timelines.home(range:)`` - retrieves the home timeline.
* ``Timelines.public(local:range:)`` - retrieves the public timeline.
* ``Timelines.tag(_:local:range:)`` - retrieves a tag timeline.

# Contributors

Special thanks to:

* [Valerii Hiora (@vhbit)](https://github.com/vhbit)

# License

Copyright (c) 2017 Ornithologist Coder and MastodonKit Contributors. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
