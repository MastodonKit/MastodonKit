# MastodonKit

MastodonKit is a Swift Framework that wraps the Mastodon API. Currently, it's a _work in progress_ but the goal is to cover all the entities and endpoints from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md).

Please note there's a lot to do before MastodonKit can be used in production code.

## Building from source

MastodonKit uses the Swift Package Manager and can be built using the following command:

```
$ git clone https://github.com/ornithocoder/MastodonKit.git
$ cd MastodonKit
$ swift build
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

# License

Copyright (c) 2017 Ornithologist Coder and MastodonKit Contributors. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
