import XCTest
@testable import MastodonKit

class ParameterTests: XCTestCase {
    func testParameterWithNameAndValue() {
        let parameter = Parameter(name: "name", value: "value")

        XCTAssertEqual(parameter.name, "name")
        XCTAssertEqual(parameter.value, "value")
    }

    func testParameterWithNameOnly() {
        let parameter = Parameter(name: "name", value: nil)

        XCTAssertEqual(parameter.name, "name")
        XCTAssertNil(parameter.value)
    }
}
