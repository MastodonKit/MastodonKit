import XCTest
@testable import MastodonKit

typealias ParserFunctionType<Model> = (Any) -> Model

class ResourcesTests: XCTestCase {
    static var allTests = [
        ("testAccountResource", testAccountResource),
        ("testAccountResourceWithInvalidArray", testAccountResourceWithInvalidArray),
        ("testAccountResourceWithInvalidDictionary", testAccountResourceWithInvalidDictionary),
        ("testAccountsResource", testAccountsResource),
        ("testAccountsResourceWithInvalidArray", testAccountsResourceWithInvalidArray),
        ("testAccountsResourceWithInvalidDictionary", testAccountsResourceWithInvalidDictionary),
        ("testCardResource", testCardResource),
        ("testCardResourceWithInvalidArray", testCardResourceWithInvalidArray),
        ("testCardResourceWithInvalidDictionary", testCardResourceWithInvalidDictionary),
        ("testContextResource", testContextResource),
        ("testContextResourceWithInvalidArray", testContextResourceWithInvalidArray),
        ("testContextResourceWithInvalidDictionary", testContextResourceWithInvalidDictionary),
        ("testInstanceResource", testInstanceResource),
        ("testInstanceResourceWithInvalidArray", testInstanceResourceWithInvalidArray),
        ("testInstanceResourceWithInvalidDictionary", testInstanceResourceWithInvalidDictionary),
        ("testLoginSettingsResource", testLoginSettingsResource),
        ("testLoginSettingsResourceWithInvalidArray", testLoginSettingsResourceWithInvalidArray),
        ("testLoginSettingsResourceWithInvalidDictionary", testLoginSettingsResourceWithInvalidDictionary),
        ("testNotificationResource", testNotificationResource),
        ("testNotificationResourceWithInvalidArray", testNotificationResourceWithInvalidArray),
        ("testNotificationResourceWithInvalidDictionary", testNotificationResourceWithInvalidDictionary),
        ("testNotificationsResource", testNotificationsResource),
        ("testNotificationsResourceWithInvalidArray", testNotificationsResourceWithInvalidArray),
        ("testNotificationsResourceWithInvalidDictionary", testNotificationsResourceWithInvalidDictionary),
        ("testRelationshipResource", testRelationshipResource),
        ("testRelationshipResourceWithInvalidArray", testRelationshipResourceWithInvalidArray),
        ("testRelationshipResourceWithInvalidDictionary", testRelationshipResourceWithInvalidDictionary),
        ("testRelationshipsResource", testRelationshipsResource),
        ("testRelationshipsResourceWithInvalidArray", testRelationshipsResourceWithInvalidArray),
        ("testRelationshipsResourceWithInvalidDictionary", testRelationshipsResourceWithInvalidDictionary),
        ("testReportResource", testReportResource),
        ("testReportResourceWithInvalidArray", testReportResourceWithInvalidArray),
        ("testReportResourceWithInvalidDictionary", testReportResourceWithInvalidDictionary),
        ("testReportsResource", testReportsResource),
        ("testReportsResourceWithInvalidArray", testReportsResourceWithInvalidArray),
        ("testReportsResourceWithInvalidDictionary", testReportsResourceWithInvalidDictionary),
        ("testResultsResource", testResultsResource),
        ("testResultsResourceWithInvalidArray", testResultsResourceWithInvalidArray),
        ("testResultsResourceWithEmptyDictionary", testResultsResourceWithEmptyDictionary),
        ("testRegisteredApplicationResource", testRegisteredApplicationResource),
        ("testRegisteredApplicationResourceWithInvalidArray", testRegisteredApplicationResourceWithInvalidArray),
        ("testRegisteredApplicationResourceWithInvalidDictionary", testRegisteredApplicationResourceWithInvalidDictionary),
        ("testStatusResource", testStatusResource),
        ("testStatusResourceWithInvalidArray", testStatusResourceWithInvalidArray),
        ("testStatusResourceWithInvalidDictionary", testStatusResourceWithInvalidDictionary),
        ("testTimelineResource", testTimelineResource),
        ("testTimelineResourceWithInvalidArray", testTimelineResourceWithInvalidArray),
        ("testTimelineResourceWithInvalidDictionary", testTimelineResourceWithInvalidDictionary)
    ]

    func testAccountResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Account.json")
        let parsed = Resource<Account?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAccountResourceWithInvalidArray() {
        let parsed = Resource<Account?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testAccountResourceWithInvalidDictionary() {
        let parsed = Resource<Account?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testAccountsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Accounts.json")
        let parsed = Resource<[Account]>.parser(jsonObject: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testAccountsResourceWithInvalidArray() {
        let parsed = Resource<[Account]>.parser(jsonObject: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testAccountsResourceWithInvalidDictionary() {
        let parsed = Resource<[Account]>.parser(jsonObject: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    func testCardResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Card.json")
        let parsed = Resource<Card?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testCardResourceWithInvalidArray() {
        let parsed = Resource<Card?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testCardResourceWithInvalidDictionary() {
        let parsed = Resource<Card?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testContextResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Context.json")
        let parsed = Resource<Context?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testContextResourceWithInvalidArray() {
        let parsed = Resource<Context?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testContextResourceWithInvalidDictionary() {
        let parsed = Resource<Context?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testInstanceResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Instance.json")
        let parsed = Resource<Instance?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testInstanceResourceWithInvalidArray() {
        let parsed = Resource<Instance?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testInstanceResourceWithInvalidDictionary() {
        let parsed = Resource<Instance?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testLoginSettingsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let parsed = Resource<LoginSettings?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testLoginSettingsResourceWithInvalidArray() {
        let parsed = Resource<LoginSettings?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testLoginSettingsResourceWithInvalidDictionary() {
        let parsed = Resource<LoginSettings?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testNotificationResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notification.json")
        let parsed = Resource<MastodonKit.Notification?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testNotificationResourceWithInvalidArray() {
        let parsed = Resource<MastodonKit.Notification?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testNotificationResourceWithInvalidDictionary() {
        let parsed = Resource<MastodonKit.Notification?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testNotificationsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notifications.json")
        let parsed = Resource<[MastodonKit.Notification]>.parser(jsonObject: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testNotificationsResourceWithInvalidArray() {
        let parsed = Resource<[MastodonKit.Notification]>.parser(jsonObject: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testNotificationsResourceWithInvalidDictionary() {
        let parsed = Resource<[MastodonKit.Notification]>.parser(jsonObject: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    func testRelationshipResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationship.json")
        let parsed = Resource<Relationship?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testRelationshipResourceWithInvalidArray() {
        let parsed = Resource<Relationship?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testRelationshipResourceWithInvalidDictionary() {
        let parsed = Resource<Relationship?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testRelationshipsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationships.json")
        let parsed = Resource<[Relationship]>.parser(jsonObject: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testRelationshipsResourceWithInvalidArray() {
        let parsed = Resource<[Relationship]>.parser(jsonObject: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testRelationshipsResourceWithInvalidDictionary() {
        let parsed = Resource<[Relationship]>.parser(jsonObject: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    func testRegisteredApplicationResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/RegisteredApplication.json")
        let parsed = Resource<RegisteredApplication?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testRegisteredApplicationResourceWithInvalidArray() {
        let parsed = Resource<RegisteredApplication?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testRegisteredApplicationResourceWithInvalidDictionary() {
        let parsed = Resource<RegisteredApplication?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testReportResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Report.json")
        let parsed = Resource<Report?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testReportResourceWithInvalidArray() {
        let parsed = Resource<Report?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testReportResourceWithInvalidDictionary() {
        let parsed = Resource<Report?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testReportsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Reports.json")
        let parsed = Resource<[Report]>.parser(jsonObject: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testReportsResourceWithInvalidArray() {
        let parsed = Resource<[Report]>.parser(jsonObject: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testReportsResourceWithInvalidDictionary() {
        let parsed = Resource<[Report]>.parser(jsonObject: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    func testResultsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/ResultsWithoutNull.json")
        let parsed = Resource<Results?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testResultsResourceWithInvalidArray() {
        let parsed = Resource<Results?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testResultsResourceWithEmptyDictionary() {
        let parsed = Resource<Results?>.parser(jsonObject: [:])

        XCTAssertNotNil(parsed)
    }

    func testStatusResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let parsed = Resource<Status?>.parser(jsonObject: fixture)

        XCTAssertNotNil(parsed)
    }

    func testStatusResourceWithInvalidArray() {
        let parsed = Resource<Status?>.parser(jsonObject: [])

        XCTAssertNil(parsed)
    }

    func testStatusResourceWithInvalidDictionary() {
        let parsed = Resource<Status?>.parser(jsonObject: [:])

        XCTAssertNil(parsed)
    }

    func testTimelineResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let parsed = Resource<[Status]>.parser(jsonObject: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testTimelineResourceWithInvalidArray() {
        let parsed = Resource<[Status]>.parser(jsonObject: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testTimelineResourceWithInvalidDictionary() {
        let parsed = Resource<[Status]>.parser(jsonObject: [:])

        XCTAssertEqual(parsed.count, 0)
    }
}
