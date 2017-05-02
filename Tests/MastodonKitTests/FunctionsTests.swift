import XCTest
@testable import MastodonKit

class FunctionsTests: XCTestCase {
    func testAccessScopeToString() {
        XCTAssertEqual(toString(scope: .read), "read")
        XCTAssertEqual(toString(scope: .write), "write")
        XCTAssertEqual(toString(scope: .follow), "follow")
    }

    func testJSONObjectAsString() {
        let validString: JSONObject = "foo"
        let invalidString: JSONObject = 42

        XCTAssertNotNil(asString(json: validString))
        XCTAssertNil(asString(json: invalidString))
    }

    func testJSONObjectAsJSONDictionary() {
        let validDictionary: JSONDictionary = ["id": 42, "name": "foo"]
        let invalidDictionary = "bar"

        XCTAssertNotNil(asJSONDictionary(json: validDictionary))
        XCTAssertNil(asJSONDictionary(json: invalidDictionary))
    }

    func testOptionalToNilOrStringFromOptionalString() {
        let invalidString: String? = nil
        let validString: String? = "foo"

        XCTAssertNil(toOptionalString(optional: invalidString))
        XCTAssertEqual(toOptionalString(optional: validString), "foo")
    }

    func testOptionalToNilOrStringFromOptionalInteger() {
        let invalidInteger: Int? = nil
        let validInteger: Int? = 42

        XCTAssertNil(toOptionalString(optional: invalidInteger))
        XCTAssertEqual(toOptionalString(optional: validInteger), "42")
    }

    func testOptionalToNilOrStringFromOptionalBoolean() {
        let invalidBoolean: Bool? = nil
        let validTrueBoolean: Bool? = true
        let validFalseBoolean: Bool? = false

        XCTAssertNil(toOptionalString(optional: invalidBoolean))
        XCTAssertEqual(toOptionalString(optional: validTrueBoolean), "true")
        XCTAssertEqual(toOptionalString(optional: validFalseBoolean), "false")
    }

    func testNilOrTrue() {
        XCTAssertNil(nilOrTrue(false))
        XCTAssertEqual(nilOrTrue(true), "true")
    }

    func testArrayOfParametersWithInteger() {
        let parameters = toArrayOfParameter(withName: "foo")(42)

        XCTAssertEqual(parameters.name, "foo[]")
        XCTAssertEqual(parameters.value, "42")
    }

    func testArrayOfParametersWithString() {
        let parameters = toArrayOfParameter(withName: "foo")("bar")

        XCTAssertEqual(parameters.name, "foo[]")
        XCTAssertEqual(parameters.value, "bar")
    }
}
