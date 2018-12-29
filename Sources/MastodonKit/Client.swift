//
//  Client.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Client: ClientType {
    let baseURL: String
    let session: URLSession
    public var accessToken: String?

    public init(baseURL: String, accessToken: String? = nil, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
        self.accessToken = accessToken
    }

    public func run<Model>(_ request: Request<Model>, completion: @escaping (Result<Model>) -> Void) {
        guard
            let components = URLComponents(baseURL: baseURL, request: request),
            let url = components.url
            else {
                completion(.failure(ClientError.malformedURL))
                return
        }

        let urlRequest = URLRequest(url: url, request: request, accessToken: accessToken)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ClientError.malformedJSON))
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
                else {
                    let mastodonError = try? MastodonError.decode(data: data)
                    let error: ClientError = mastodonError.map { .mastodonError($0.description) } ?? .genericError
                    completion(.failure(error))
                    return
            }

            guard let model = try? Model.decode(data: data) else {
                completion(.failure(ClientError.invalidModel))
                return
            }

            completion(.success(model, httpResponse.pagination))
        }

        task.resume()
    }

    /// OAuth authorization URL. Use this to initiate a standard OAuth login.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - scopes: The access scopes.
    ///   - redirectURI: The client redirectURI.
    /// - Returns: URL for the OAuth authorization endpoint.
    public func oauthAuthorizationURL(clientID: String, scopes: [AccessScope], redirectURI: String) -> URL? {
        let parameters = [
            Parameter(name: "client_id", value: clientID),
            Parameter(name: "scope", value: scopes.map(toString).joined(separator: " ")),
            Parameter(name: "redirect_uri", value: redirectURI),
            Parameter(name: "response_type", value: "code")
        ]

        let method = HTTPMethod.get(.parameters(parameters))
        let request = Request<LoginSettings>(path: "/oauth/authorize", method: method)
        return URLComponents(baseURL: baseURL, request: request)?.url
    }
}
