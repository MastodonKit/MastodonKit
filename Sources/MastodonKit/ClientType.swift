//
//  ClientType.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/12/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation
import FoundationNetworking

public protocol ClientType {
    /// The user access token used to perform the network requests.
    var accessToken: String? { get set }

    /// Mastodon Client's initializer.
    ///
    /// - Parameters:
    ///   - baseURL: The Mastodon instance URL
    ///   - accessToken: The user access token used to perform the network requests (optional).
    ///   - session: The URLSession used to perform the network requests.
    init(baseURL: String, accessToken: String?, session: URLSession)

    /// Performs the network request.
    ///
    /// - Parameters:
    ///   - request: The request to be performed.
    ///   - completion: The completion block to be called when the request is complete.
    ///   - result: The request result.
    func run<Model>(_ request: Request<Model>,
                    completion: @escaping (_ result: Result<Response<Model>, Error>) -> Void)

#if compiler(>=5.5) && canImport(_Concurrency)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func run<Model>(_ request: Request<Model>) async throws -> Response<Model>
#endif
}
