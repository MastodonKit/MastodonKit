import Foundation

enum FixtureError: Error {
    case invalidPath, parseError
}

struct Fixture {
    static func load(fileName: String) throws -> Any {
        var testsDirectory = URL(fileURLWithPath: #file, isDirectory: false)
        testsDirectory.deleteLastPathComponent()

        guard let filePath = URL(string: fileName, relativeTo: testsDirectory) else {
            throw FixtureError.invalidPath
        }

        guard
            let data = try? Data(contentsOf: filePath),
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
            else {
                throw FixtureError.parseError
        }

        return jsonObject
    }
}
