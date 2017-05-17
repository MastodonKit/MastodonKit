import Foundation

public typealias AccountRequest = Request<Account>
public typealias AccountsRequest = Request<[Account]>
public typealias AttachmentRequest = Request<Attachment>
public typealias CardRequest = Request<Card>
public typealias ClientApplicationRequest = Request<ClientApplication>
public typealias ContextRequest = Request<Context>
public typealias InstanceRequest = Request<Instance>
public typealias LoginSettingsRequest = Request<LoginSettings>
public typealias NotificationRequest = Request<Notification>
public typealias NotificationsRequest = Request<[Notification]>
public typealias RelationshipRequest = Request<Relationship>
public typealias RelationshipsRequest = Request<[Relationship]>
public typealias ReportRequest = Request<Report>
public typealias ReportsRequest = Request<[Report]>
public typealias ResultsRequest = Request<Results>
public typealias StatusRequest = Request<Status>
public typealias TimelineRequest = Request<[Status]>

typealias JSONObject = Any
typealias JSONDictionary = [String: JSONObject]

// MARK: AccountRequest

extension Request where Model == Account {
    static func parser(json: JSONObject) -> Account? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Account(from: dictionary)
    }
}

// MARK: AccountsRequest

extension Request where Model == [Account] {
    static func parser(json: JSONObject) -> [Account] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Account.init)
    }
}

// MARK: AttachmentRequest

extension Request where Model == Attachment {
    static func parser(json: JSONObject) -> Attachment? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Attachment(from: dictionary)
    }
}

// MARK: CardRequest

extension Request where Model == Card {
    static func parser(json: JSONObject) -> Card? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Card(from: dictionary)
    }
}

// MARK: ContextRequest

extension Request where Model == Context {
    static func parser(json: JSONObject) -> Context? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Context(from: dictionary)
    }
}

// MARK: InstanceRequest

extension Request where Model == Instance {
    static func parser(json: JSONObject) -> Instance? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Instance(from: dictionary)
    }
}

// MARK: LoginSettingsRequest

extension Request where Model == LoginSettings {
    static func parser(json: JSONObject) -> LoginSettings? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return LoginSettings(from: dictionary)
    }
}

// MARK: NotificationRequest

extension Request where Model == Notification {
    static func parser(json: JSONObject) -> Notification? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Notification(from: dictionary)
    }
}

// MARK: NotificationsRequest

extension Request where Model == [Notification] {
    static func parser(json: JSONObject) -> [Notification] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Notification.init)
    }
}

// MARK: RelationshipRequest

extension Request where Model == Relationship {
    static func parser(json: JSONObject) -> Relationship? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Relationship(from: dictionary)
    }
}

// MARK: RelationshipsRequest

extension Request where Model == [Relationship] {
    static func parser(json: JSONObject) -> [Relationship] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Relationship.init)
    }
}

// MARK: ClientApplicationRequest

extension Request where Model == ClientApplication {
    static func parser(json: JSONObject) -> ClientApplication? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return ClientApplication(from: dictionary)
    }
}

// MARK: ReportRequest

extension Request where Model == Report {
    static func parser(json: JSONObject) -> Report? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Report(from: dictionary)
    }
}

// MARK: ReportsRequest

extension Request where Model == [Report] {
    static func parser(json: JSONObject) -> [Report] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Report.init)
    }
}

// MARK: ResultsRequest

extension Request where Model == Results {
    static func parser(json: JSONObject) -> Results? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Results(from: dictionary)
    }
}

// MARK: StatusRequest

extension Request where Model == Status {
    static func parser(json: JSONObject) -> Status? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Status(from: dictionary)
    }
}

// MARK: TimelineRequest

extension Request where Model == [Status] {
    static func parser(json: JSONObject) -> [Status] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Status.init)
    }
}
