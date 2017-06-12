# Making Requests

To perform a network request against a Mastodon instance, first create a request and then *run* it using the client. Below two examples:

**Getting the home timeline**

```swift
let request = Timelines.home()

client.run(request) { result in
    // do something with 'result'
}
```

**Posting a new status**

```swift
let request = Statuses.create("Mastodon's API is awesome!")

client.run(request) { result in
    // do something with 'result'
}
```
