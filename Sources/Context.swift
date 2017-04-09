import Foundation

public struct Context {
    public let ancestors: [Status]
    public let descendants: [Status]
}

extension Context {
    init?(json: JSONDictionary) {
        guard
            let ancestorsArray = json["ancestors"] as? [JSONDictionary],
            let descendantsArray = json["descendants"] as? [JSONDictionary]
            else {
                return nil
        }

        self.ancestors = ancestorsArray.flatMap(Status.init)
        self.descendants = descendantsArray.flatMap(Status.init)
    }
}
