import Foundation

public struct Clients {
    /// Registers an application.
    ///
    /// - Parameters:
    ///   - appName: Name of your application.
    ///   - redirectURI: Where the user should be redirected after authorization (for no redirect, omit this parameter).
    ///   - scopes: Application's access scopes.
    ///   - website: URL to the homepage of your app.
    /// - Returns: Resource for `ClientApplication`.
    public static func registerClient(name: String, redirectURI: String = "urn:ietf:wg:oauth:2.0:oob", scopes: [AccessScope], website: String? = nil) -> ClientApplicationResource {
        let dictionary: [String : String?] = [
            "client_name": name,
            "redirect_uris": redirectURI,
            "website": website,
            "scopes": scopes.map(toString).joined(separator: "+")
        ]

        let parameters = dictionary.flatMap(toQueryItem)

        return ClientApplicationResource(path: "/api/v1/apps", parameters: parameters, method: .post, parse: ClientApplicationResource.parser)
    }
}
