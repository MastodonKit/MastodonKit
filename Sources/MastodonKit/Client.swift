//
//  Client.swift
//  MastodonKit
//
//  Created by Ornithologist Coder in 2017.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public final class Client {
    let baseURL: String
    public var accessToken: String?
    lazy var session = URLSession.shared

    public init(baseURL: String, accessToken: String? = nil) {
        self.baseURL = baseURL
        self.accessToken = accessToken
    }

    public func run<Model>(_ request: Request<Model>, completion: @escaping (Result<Model>) -> Void) {
        guard
            let components = URLComponents(baseURL: baseURL, request: request),
            let requestURL = components.url
            else {
                completion(.failure(ClientError.malformedURL))
                return
        }

        let urlRequest = URLRequest(url: requestURL, request: request, accessToken: accessToken)

        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
                else {
                    completion(.failure(ClientError.malformedJSON))
                    return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
                else {
                    let mastodonError = MastodonError(json: jsonObject)
                    completion(.failure(ClientError.mastodonError(mastodonError.description)))
                    return
            }

            guard let model = request.parse(jsonObject) else {
                completion(.failure(ClientError.invalidModel))
                return
            }

            completion(.success(model, httpResponse.pagination))
        }

        task.resume()
    }
}
