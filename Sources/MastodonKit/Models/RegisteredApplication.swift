import Foundation

public struct RegisteredApplication {
    /// The application ID.
    public let id: Int
    /// Where the user should be redirected after authorization.
    public let redirectURI: String
    /// The application client ID.
    public let clientID: String
    /// The application client secret.
    public let clientSecret: String

    // MARK: - Private

    init?(json: JSONDictionary) {
        guard
            let id = json["id"] as? Int,
            let redirectURI = json["redirect_uri"] as? String,
            let clientID = json["client_id"] as? String,
            let clientSecret = json["client_secret"] as? String
            else {
                return nil
        }

        self.id = id
        self.redirectURI = redirectURI
        self.clientID = clientID
        self.clientSecret = clientSecret
    }
}
