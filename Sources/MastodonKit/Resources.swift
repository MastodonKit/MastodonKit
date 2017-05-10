import Foundation

public typealias AccountResource = Resource<Account>
public typealias AccountsResource = Resource<[Account]>
public typealias AttachmentResource = Resource<Attachment>
public typealias CardResource = Resource<Card>
public typealias ClientApplicationResource = Resource<ClientApplication>
public typealias ContextResource = Resource<Context>
public typealias InstanceResource = Resource<Instance>
public typealias LoginSettingsResource = Resource<LoginSettings>
public typealias NotificationResource = Resource<Notification>
public typealias NotificationsResource = Resource<[Notification]>
public typealias RelationshipResource = Resource<Relationship>
public typealias RelationshipsResource = Resource<[Relationship]>
public typealias ReportResource = Resource<Report>
public typealias ReportsResource = Resource<[Report]>
public typealias ResultsResource = Resource<Results>
public typealias StatusResource = Resource<Status>
public typealias TimelineResource = Resource<[Status]>

typealias JSONObject = Any
typealias JSONDictionary = [String: JSONObject]

// MARK: AccountResource

extension Resource where Model == Account {
    static func parser(json: JSONObject) -> Account? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Account(from: dictionary)
    }
}

// MARK: AccountsResource

extension Resource where Model == [Account] {
    static func parser(json: JSONObject) -> [Account] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Account.init)
    }
}

// MARK: AttachmentResource

extension Resource where Model == Attachment {
    static func parser(json: JSONObject) -> Attachment? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Attachment(from: dictionary)
    }
}

// MARK: CardResource

extension Resource where Model == Card {
    static func parser(json: JSONObject) -> Card? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Card(from: dictionary)
    }
}

// MARK: ContextResource

extension Resource where Model == Context {
    static func parser(json: JSONObject) -> Context? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Context(from: dictionary)
    }
}

// MARK: InstanceResource

extension Resource where Model == Instance {
    static func parser(json: JSONObject) -> Instance? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Instance(from: dictionary)
    }
}

// MARK: LoginSettingsResource

extension Resource where Model == LoginSettings {
    static func parser(json: JSONObject) -> LoginSettings? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return LoginSettings(from: dictionary)
    }
}

// MARK: NotificationResource

extension Resource where Model == Notification {
    static func parser(json: JSONObject) -> Notification? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Notification(from: dictionary)
    }
}

// MARK: NotificationsResource

extension Resource where Model == [Notification] {
    static func parser(json: JSONObject) -> [Notification] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Notification.init)
    }
}

// MARK: RelationshipResource

extension Resource where Model == Relationship {
    static func parser(json: JSONObject) -> Relationship? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Relationship(from: dictionary)
    }
}

// MARK: RelationshipsResource

extension Resource where Model == [Relationship] {
    static func parser(json: JSONObject) -> [Relationship] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Relationship.init)
    }
}

// MARK: ClientApplicationResource

extension Resource where Model == ClientApplication {
    static func parser(json: JSONObject) -> ClientApplication? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return ClientApplication(from: dictionary)
    }
}

// MARK: ReportResource

extension Resource where Model == Report {
    static func parser(json: JSONObject) -> Report? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Report(from: dictionary)
    }
}

// MARK: ReportsResource

extension Resource where Model == [Report] {
    static func parser(json: JSONObject) -> [Report] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Report.init)
    }
}

// MARK: ResultsResource

extension Resource where Model == Results {
    static func parser(json: JSONObject) -> Results? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Results(from: dictionary)
    }
}

// MARK: StatusResource

extension Resource where Model == Status {
    static func parser(json: JSONObject) -> Status? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Status(from: dictionary)
    }
}

// MARK: TimelineResource

extension Resource where Model == [Status] {
    static func parser(json: JSONObject) -> [Status] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Status.init)
    }
}
