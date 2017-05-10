import XCTest
@testable import MastodonKit

class MediaTests: XCTestCase {
    func testUpload() {
        let resource = Media.upload(media: .other(Data(), fileExtension: "fake", mimeType: "media/fake"))

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/media")

        // Method
        XCTAssertEqual(resource.method.name, "POST")
        XCTAssertNil(resource.method.queryItems)
        XCTAssertNotNil(resource.method.httpBody)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Attachment?>.self)
    }
}
