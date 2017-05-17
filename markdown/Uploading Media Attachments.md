# Uploading Media Attachments

To upload images to Mastodon, create a media attachment containing the file data (``Data``) and then pass the media attachment as argument to the ``Media.upload(media:)`` method. Supported media attachments types are ``.jpeg``, ``.png``, and ``.gif``. Examples:

Uploading the JPEG representation of an ``UIImage``:

```swift
let image = UIImage(named: "mastodon_logo")
let imageData = UIImageJPEGRepresentation(image, 0.82)

let request = Media.upload(media: .jpeg(imageData))

client.run(request) { attachment, error in
    // do something with 'attachment'
}
```

Uploading a GIF image from the main bundle:

```swift
let imagePath = Bundle.main.path(forRequest: "funny_meme", ofType: ".gif")
let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath!))

let request = Media.upload(media: .gif(imageData))

client.run(request) { attachment, error in
    // do something with 'attachment'
}
```

Use the URL and id from ``attachment`` when creating a status.
