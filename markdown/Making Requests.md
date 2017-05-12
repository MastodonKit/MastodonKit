# Making Requests

To perform a network request against a Mastodon instance, first create a resource and then *run* it using the client. Below two examples:

**Getting the home timeline**

```swift
let resource = Timelines.home()

client.run(resource) { statuses, error in
    // do something with 'statuses'
}
```

**Posting a new status**

```swift
let resource = Statuses.create("Mastodon's API is awesome!")

client.run(resource) { status, error in
    // do something with 'status'
}
```
