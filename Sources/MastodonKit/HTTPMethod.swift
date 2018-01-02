//
//  HTTPMethod.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/28/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case get(Payload)
    case post(Payload)
    case put(Payload)
    case patch(Payload)
    case delete(Payload)
}

extension HTTPMethod {
    var name: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .delete: return "DELETE"
        case .patch: return "PATCH"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .get(let payload): return payload.items
        default: return nil
        }
    }

    var httpBody: Data? {
        switch self {
        case .post(let payload): return payload.data
        case .put(let payload): return payload.data
        case .patch(let payload): return payload.data
        case .delete(let payload): return payload.data
        default: return nil
        }
    }

    var contentType: String? {
        switch self {
        case .post(let payload): return payload.type
        case .put(let payload): return payload.type
        case .patch(let payload): return payload.type
        case .delete(let payload): return payload.type
        default: return nil
        }
    }
}
