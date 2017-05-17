import XCTest
@testable import MastodonKit

class MediaTests: XCTestCase {
    func testUpload() {
        let request = Media.upload(media: .other(Data(), fileExtension: "fake", mimeType: "media/fake"))

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/media")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: request.parse) == ParserFunctionType<Attachment?>.self)
    }
}
