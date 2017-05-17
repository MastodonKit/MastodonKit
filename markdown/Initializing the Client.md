# Initializing the Client

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

let request = Clients.register(
    clientName: "MastodonKit Test Client",
    scopes: [.read, .write, .follow],
    website: "https://github.com/MastodonKit/MastodonKit"
)

client.run(request) { application, error in
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
let loginRequest = Login.silent(
    clientID: "very long client id",
    clientSecret: "very long client secret",
    scopes: [.read, .write],
    username: "foo",
    password: "bar"
)

client.run(loginRequest) { loginSettings, error in
    if let loginSettings = loginSettings {
        print("access token: \(loginSettings.accessToken)")
    }
}
```

Bear in mind the method above should never be used when deadling with other user's accounts.