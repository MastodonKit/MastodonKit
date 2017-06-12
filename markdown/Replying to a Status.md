# Replying to a Status

When building a client application that allows users to reply to other users, it's important to include in the reply message the author of the status being replied to (``status.account``), as well all the people mentioned on the original message  (``status.mentions``).

To mention a user, use the [Account](https://mastodonkit.github.io/MastodonKit/docs/Structs/Account.html)'s ``acct`` property instead of the ``username``. The first one carries the instance information while the latter doesn't.

```swift
let statusAuthor = status.account.acct
// String, "ornithocoder"

let mentionedAccountsOnStatus = status.mentions.flatMap { $0.acct }
// [String], ["eurasierboy@mastodon.social", "ashfurrow"]

let allAccounts = [statusAuthor] + mentionedAccountsOnStatus
// [String], ["ornithocoder", "eurasierboy@mastodon.social", "ashfurrow"]

textView.text = allAccounts.map{ "@" + $0 }.reduce("") { $0 + $1 + " " }
// String, "@ornithocoder @eurasierboy@mastodon.social @ashfurrow"

// ... append seomthing to textView.text, example: "that's awesome"
// String, "@ornithocoder @eurasierboy@mastodon.social @ashfurrow that's awesome"

let post = Statuses.create(status: textView.text, replyToID: status.id)

client.run(post) { result in
    // do something with 'result'
}
```
