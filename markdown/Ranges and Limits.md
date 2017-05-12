# Ranges and Limits

Some resources take an optional `ResourceRange` parameter. This parameter should be used to specify the range of IDs to get and the number of entities to fetch. The possible options are:

* `.since(id: Int, limit: Int?)`: Gets a list with IDs greater than this value. Note: Passing `nil` as `limit` asks Mastodon to return the default number of entities for that endpoint.
* `.max(id: Int, limit: Int?)`: Gets a list with IDs less than or equal this value. Note: Passing `nil` as `limit` asks Mastodon to return the default number of entities for that endpoint.
* `.limit(Int)`: Sets the maximum number of entities to get.
* `.default`: Applies the default values.

Omitting the `range` paramater on the method call has the same effect of passing `.default`.

Examples:

```swift
// Since + limit
let resource = Timelines.home(range: .since(id: 42, limit: 30))

// Limit
let resource = Timelines.home(range: .limit(30))

// Max + default limit
let resource = Timelines.home(range: .max(id: 42, limit: nil))

// Default range and limit
let resource = Timelines.home()
let resource = Timelines.home(range: .default)
```
