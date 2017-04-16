import Foundation

public struct Card {
    /// The url associated with the card.
    public let url: URL

    /// The title of the card.
    public let title: String

    /// The card description.
    public let description: String

    /// The image associated with the card, if any.
    public let image: URL?
}

extension Card {
    init?(json: JSONDictionary) {
        guard
            let urlString = json["url"] as? String,
            let url = URL(string: urlString),
            let title = json["title"] as? String,
            let description = json["description"] as? String
            else {
                return nil
        }

        self.url = url
        self.title = title
        self.description = description

        let imageURLString = json["image"] as? String
        self.image = imageURLString != nil ? URL(string: imageURLString!) : nil
    }
}
