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

    func testToQueryItem() {
        XCTAssertNotNil(toQueryItem(name: "foo", value: "bar"))
        XCTAssertNil(toQueryItem(name: "foo", value: nil))
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

    func testStringsToQueryString() {
        XCTAssertEqual(toString(name: "foo", value: "bar"), "foo=bar")
        XCTAssertNil(toString(name: "foo", value: nil))
    }

    func testParametersToQueryItems()  {
        let emptyParamters: Parameters = [:]
        XCTAssertEqual(toQueryItems(parameter: emptyParamters)?.count, 0)

        let paramters: Parameters = ["id": "42", "name": "foo", "url": nil]
        let queryItems = toQueryItems(parameter: paramters)
        XCTAssertEqual(queryItems?.count, 2)
        XCTAssertTrue(queryItems!.contains(URLQueryItem(name: "id", value: "42")))
        XCTAssertTrue(queryItems!.contains(URLQueryItem(name: "name", value: "foo")))
    }

    func testParametersToData()  {
        let emptyParamters: Parameters = [:]
        let emptyParamtersData = toData(parameter: emptyParamters)
        XCTAssertEqual(emptyParamtersData?.count, 0)

        let paramters: Parameters = ["id": "42", "name": "foo", "url": nil]
        let paramtersData = toData(parameter: paramters)
        XCTAssertEqual(paramtersData?.count, 14)
    }
}
