import Foundation

public typealias AccountResource = Resource<Account?>
public typealias AccountsResource = Resource<[Account]>
public typealias CardResource = Resource<Card?>
public typealias ContextResource = Resource<Context?>
public typealias InstanceResource = Resource<Instance?>
public typealias NotificationResource = Resource<Notification?>
public typealias NotificationsResource = Resource<[Notification]>
public typealias RelationshipResource = Resource<Relationship?>
public typealias RelationshipsResource = Resource<[Relationship]>
public typealias ReportResource = Resource<Report?>
public typealias ReportsResource = Resource<[Report]>
public typealias ResultsResource = Resource<Results?>
public typealias StatusResource = Resource<Status?>
public typealias TimelineResource = Resource<[Status]>

// MARK: AccountResource

extension Resource where Model == Account? {
    static func parser(jsonObject: Any) -> Account? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Account(json: json)
    }
}

// MARK: AccountsResource

extension Resource where Model == [Account] {
    static func parser(jsonObject: Any) -> [Account] {
        guard let array = jsonObject as? [JSONDictionary] else { return [] }
        return array.flatMap(Account.init)
    }
}

// MARK: CardResource

extension Resource where Model == Card? {
    static func parser(jsonObject: Any) -> Card? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Card(json: json)
    }
}

// MARK: ContextResource

extension Resource where Model == Context? {
    static func parser(jsonObject: Any) -> Context? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Context(json: json)
    }
}

// MARK: InstanceResource

extension Resource where Model == Instance? {
    static func parser(jsonObject: Any) -> Instance? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Instance(json: json)
    }
}

// MARK:  NotificationResource

extension Resource where Model == Notification? {
    static func parser(jsonObject: Any) -> Notification? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Notification(json: json)
    }
}

// MARK:  NotificationsResource

extension Resource where Model == [Notification] {
    static func parser(jsonObject: Any) -> [Notification] {
        guard let array = jsonObject as? [JSONDictionary] else { return [] }
        return array.flatMap(Notification.init)
    }
}

// MARK: RelationshipResource

extension Resource where Model == Relationship? {
    static func parser(jsonObject: Any) -> Relationship? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Relationship(json: json)
    }
}

// MARK: RelationshipsResource

extension Resource where Model == [Relationship] {
    static func parser(jsonObject: Any) -> [Relationship] {
        guard let array = jsonObject as? [JSONDictionary] else { return [] }
        return array.flatMap(Relationship.init)
    }
}

// MARK: ReportResource

extension Resource where Model == Report? {
    static func parser(jsonObject: Any) -> Report? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Report(json: json)
    }
}

// MARK: ReportsResource

extension Resource where Model == [Report] {
    static func parser(jsonObject: Any) -> [Report] {
        guard let array = jsonObject as? [JSONDictionary] else { return [] }
        return array.flatMap(Report.init)
    }
}

// MARK: ResultsResource

extension Resource where Model == Results? {
    static func parser(jsonObject: Any) -> Results? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Results(json: json)
    }
}

// MARK: StatusResource

extension Resource where Model == Status? {
    static func parser(jsonObject: Any) -> Status? {
        guard let json = jsonObject as? JSONDictionary else { return nil }
        return Status(json: json)
    }
}

// MARK: TimelineResource

extension Resource where Model == [Status] {
    static func parser(jsonObject: Any) -> [Status] {
        guard let array = jsonObject as? [JSONDictionary] else { return [] }
        return array.flatMap(Status.init)
    }
}
