import XCTest
@testable import MastodonKit

typealias ParserFunctionType<Model> = (Any) -> Model

class ResourcesTests: XCTestCase {
    // MARK: AccountResource

    func testAccountResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Account.json")
        let parsed = Resource<Account>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAccountResourceWithInvalidArray() {
        let parsed = Resource<Account>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testAccountResourceWithInvalidDictionary() {
        let parsed = Resource<Account>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: AccountsResource

    func testAccountsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Accounts.json")
        let parsed = Resource<[Account]>.parser(json: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testAccountsResourceWithInvalidArray() {
        let parsed = Resource<[Account]>.parser(json: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testAccountsResourceWithInvalidDictionary() {
        let parsed = Resource<[Account]>.parser(json: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    // MARK: AttachmentResource

    func testAttachmentResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Attachment.json")
        let parsed = Resource<Attachment>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAttachmentResourceWithInvalidArray() {
        let parsed = Resource<Attachment>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testAttachmentResourceWithInvalidDictionary() {
        let parsed = Resource<Attachment>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: CardResource

    func testCardResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Card.json")
        let parsed = Resource<Card>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testCardResourceWithInvalidArray() {
        let parsed = Resource<Card>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testCardResourceWithInvalidDictionary() {
        let parsed = Resource<Card>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: ClientApplicationResource

    func testClientApplicationResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/ClientApplication.json")
        let parsed = Resource<ClientApplication>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testClientApplicationResourceWithInvalidArray() {
        let parsed = Resource<ClientApplication>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testClientApplicationResourceWithInvalidDictionary() {
        let parsed = Resource<ClientApplication>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: ContextResource

    func testContextResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Context.json")
        let parsed = Resource<Context>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testContextResourceWithInvalidArray() {
        let parsed = Resource<Context>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testContextResourceWithInvalidDictionary() {
        let parsed = Resource<Context>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: InstanceResource

    func testInstanceResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Instance.json")
        let parsed = Resource<Instance>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testInstanceResourceWithInvalidArray() {
        let parsed = Resource<Instance>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testInstanceResourceWithInvalidDictionary() {
        let parsed = Resource<Instance>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: LoginSettingsResource

    func testLoginSettingsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let parsed = Resource<LoginSettings>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testLoginSettingsResourceWithInvalidArray() {
        let parsed = Resource<LoginSettings>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testLoginSettingsResourceWithInvalidDictionary() {
        let parsed = Resource<LoginSettings>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK:  NotificationResource

    func testNotificationResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notification.json")
        let parsed = Resource<MastodonKit.Notification>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testNotificationResourceWithInvalidArray() {
        let parsed = Resource<MastodonKit.Notification>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testNotificationResourceWithInvalidDictionary() {
        let parsed = Resource<MastodonKit.Notification>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK:  NotificationsResource

    func testNotificationsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notifications.json")
        let parsed = Resource<[MastodonKit.Notification]>.parser(json: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testNotificationsResourceWithInvalidArray() {
        let parsed = Resource<[MastodonKit.Notification]>.parser(json: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testNotificationsResourceWithInvalidDictionary() {
        let parsed = Resource<[MastodonKit.Notification]>.parser(json: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    // MARK: RelationshipResource

    func testRelationshipResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationship.json")
        let parsed = Resource<Relationship>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testRelationshipResourceWithInvalidArray() {
        let parsed = Resource<Relationship>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testRelationshipResourceWithInvalidDictionary() {
        let parsed = Resource<Relationship>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: RelationshipsResource

    func testRelationshipsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationships.json")
        let parsed = Resource<[Relationship]>.parser(json: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testRelationshipsResourceWithInvalidArray() {
        let parsed = Resource<[Relationship]>.parser(json: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testRelationshipsResourceWithInvalidDictionary() {
        let parsed = Resource<[Relationship]>.parser(json: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    // MARK: ReportResource

    func testReportResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Report.json")
        let parsed = Resource<Report>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testReportResourceWithInvalidArray() {
        let parsed = Resource<Report>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testReportResourceWithInvalidDictionary() {
        let parsed = Resource<Report>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: ReportsResource

    func testReportsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Reports.json")
        let parsed = Resource<[Report]>.parser(json: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testReportsResourceWithInvalidArray() {
        let parsed = Resource<[Report]>.parser(json: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testReportsResourceWithInvalidDictionary() {
        let parsed = Resource<[Report]>.parser(json: [:])

        XCTAssertEqual(parsed.count, 0)
    }

    // MARK: ResultsResource

    func testResultsResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/ResultsWithoutNull.json")
        let parsed = Resource<Results>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testResultsResourceWithInvalidArray() {
        let parsed = Resource<Results>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testResultsResourceWithEmptyDictionary() {
        let parsed = Resource<Results>.parser(json: [:])

        XCTAssertNotNil(parsed)
    }

    // MARK: StatusResource

    func testStatusResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let parsed = Resource<Status>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testStatusResourceWithInvalidArray() {
        let parsed = Resource<Status>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testStatusResourceWithInvalidDictionary() {
        let parsed = Resource<Status>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: TimelineResource

    func testTimelineResource() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let parsed = Resource<[Status]>.parser(json: fixture)

        XCTAssertEqual(parsed.count, 2)
    }

    func testTimelineResourceWithInvalidArray() {
        let parsed = Resource<[Status]>.parser(json: [])

        XCTAssertEqual(parsed.count, 0)
    }

    func testTimelineResourceWithInvalidDictionary() {
        let parsed = Resource<[Status]>.parser(json: [:])

        XCTAssertEqual(parsed.count, 0)
    }
}
