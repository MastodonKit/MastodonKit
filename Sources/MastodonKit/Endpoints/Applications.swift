import Foundation

public struct Applications {
    /// Registers an application.
    ///
    /// - Parameters:
    ///   - appName: Name of your application.
    ///   - redirectURI: Where the user should be redirected after authorization (for no redirect, omit this parameter).
    ///   - scopes: Application's access scopes.
    ///   - website: URL to the homepage of your app.
    /// - Returns: Resource for `RegisteredApplication?`.
    public static func registerClient(name: String, redirectURI: String = "urn:ietf:wg:oauth:2.0:oob", scopes: [AccessScope], website: String? = nil) -> RegisteredApplicationResource {
        let dictionary: [String : String?] = [
            "client_name": name,
            "redirect_uris": redirectURI,
            "website": website,
            "scopes": scopes.map(toString).joined(separator: "+")
        ]

        let parameters = dictionary.flatMap(toQueryItem)

        return RegisteredApplicationResource(path: "/api/v1/apps", parameters: parameters, method: .post, parse: RegisteredApplicationResource.parser)
    }
}
