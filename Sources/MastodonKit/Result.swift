//
//  Result.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/6/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum Result<Model> {
    /// Success wraps a model and an optional pagination
    case success(Model, Pagination?)
    /// Failure wraps an ErrorType
    case failure(Error)
}

extension Result {
    /// Convenience getter for the value.
    public var value: Model? {
        switch self {
        case .success(let value, _): return value
        case .failure: return nil
        }
    }

    /// Convenience getter for the pagination.
    public var pagination: Pagination? {
        switch self {
        case .success(_, let pagination): return pagination
        case .failure: return nil
        }
    }

    /// Convenience getter for the error.
    public var error: Error? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }

    /// Convenience getter to test whether the result is an error or not.
    public var isError: Bool {
        switch self {
        case .success: return false
        case .failure: return true
        }
    }
}
