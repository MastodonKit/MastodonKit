//
//  Fixture.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

enum FixtureError: Error {
    case invalidPath, invalidData
}

enum Fixture {
    static func load(fileName: String) throws -> Data {
        var testsDirectory = URL(fileURLWithPath: #file, isDirectory: false)
        testsDirectory.deleteLastPathComponent()

        guard let filePath = URL(string: fileName, relativeTo: testsDirectory) else {
            throw FixtureError.invalidPath
        }

        guard let jsonData = try? Data(contentsOf: filePath) else {
            throw FixtureError.invalidData
        }

        return jsonData
    }
}
