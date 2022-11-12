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

    public func run<Model>(_ request: Request<Model>,
                           completion: @escaping (Result<Response<Model>, Error>) -> Void) {
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

            completion(.success(.init(value: model, pagination: httpResponse.pagination)))
        }

        task.resume()
    }

#if compiler(>=5.6.0) && canImport(_Concurrency)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func run<Model>(_ request: Request<Model>) async throws -> Response<Model> {
        try await withCheckedThrowingContinuation { continuation in
            run(request) { result in
                continuation.resume(with: result)
            }
        }
    }
#endif
}
