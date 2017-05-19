import Foundation

typealias JSONObject = Any
typealias JSONDictionary = [String: JSONObject]

// MARK: Request<Account>

extension Request where Model == Account {
    static func parser(json: JSONObject) -> Account? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Account(from: dictionary)
    }
}

// MARK: Request<[Account]>

extension Request where Model == [Account] {
    static func parser(json: JSONObject) -> [Account] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Account.init)
    }
}

// MARK: Request<Attachment>

extension Request where Model == Attachment {
    static func parser(json: JSONObject) -> Attachment? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Attachment(from: dictionary)
    }
}

// MARK: Request<Card>

extension Request where Model == Card {
    static func parser(json: JSONObject) -> Card? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Card(from: dictionary)
    }
}

// MARK: Request<Context>

extension Request where Model == Context {
    static func parser(json: JSONObject) -> Context? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Context(from: dictionary)
    }
}

// MARK: Request<Instance>

extension Request where Model == Instance {
    static func parser(json: JSONObject) -> Instance? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Instance(from: dictionary)
    }
}

// MARK: Request<LoginSettings>

extension Request where Model == LoginSettings {
    static func parser(json: JSONObject) -> LoginSettings? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return LoginSettings(from: dictionary)
    }
}

// MARK: Request<Notification>

extension Request where Model == Notification {
    static func parser(json: JSONObject) -> Notification? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Notification(from: dictionary)
    }
}

// MARK: Request<[Notification]>

extension Request where Model == [Notification] {
    static func parser(json: JSONObject) -> [Notification] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Notification.init)
    }
}

// MARK: Request<Relationship>

extension Request where Model == Relationship {
    static func parser(json: JSONObject) -> Relationship? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Relationship(from: dictionary)
    }
}

// MARK: Request<[Relationship]>

extension Request where Model == [Relationship] {
    static func parser(json: JSONObject) -> [Relationship] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Relationship.init)
    }
}

// MARK: Request<ClientApplication>

extension Request where Model == ClientApplication {
    static func parser(json: JSONObject) -> ClientApplication? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return ClientApplication(from: dictionary)
    }
}

// MARK: Request<Report>

extension Request where Model == Report {
    static func parser(json: JSONObject) -> Report? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Report(from: dictionary)
    }
}

// MARK: Request<[Report]>

extension Request where Model == [Report] {
    static func parser(json: JSONObject) -> [Report] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Report.init)
    }
}

// MARK: Request<Results>

extension Request where Model == Results {
    static func parser(json: JSONObject) -> Results? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Results(from: dictionary)
    }
}

// MARK: Request<Status>

extension Request where Model == Status {
    static func parser(json: JSONObject) -> Status? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Status(from: dictionary)
    }
}

// MARK: Request<[Status]>

extension Request where Model == [Status] {
    static func parser(json: JSONObject) -> [Status] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Status.init)
    }
}
