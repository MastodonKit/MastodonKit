//
//  RequestParsersTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

typealias ParserFunctionType<Model> = (Any) -> Model?

class RequestParsersTests: XCTestCase {
    // MARK: Request<Account>

    func testAccountRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Account.json")
        let parsed = Request<Account>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAccountRequestWithInvalidArray() {
        let parsed = Request<Account>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testAccountRequestWithInvalidDictionary() {
        let parsed = Request<Account>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Account]>

    func testAccountsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Accounts.json")
        let parsed = Request<[Account]>.parser(json: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testAccountsRequestWithEmptyArray() {
        let parsed = Request<[Account]>.parser(json: [])

        XCTAssertEqual(parsed?.count, 0)
    }

    func testAccountsRequestWithInvalidDictionary() {
        let parsed = Request<[Account]>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Attachment>

    func testAttachmentRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Attachment.json")
        let parsed = Request<Attachment>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAttachmentRequestWithInvalidArray() {
        let parsed = Request<Attachment>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testAttachmentRequestWithInvalidDictionary() {
        let parsed = Request<Attachment>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Card>

    func testCardRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Card.json")
        let parsed = Request<Card>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testCardRequestWithInvalidArray() {
        let parsed = Request<Card>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testCardRequestWithInvalidDictionary() {
        let parsed = Request<Card>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<ClientApplication>

    func testClientApplicationRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/ClientApplication.json")
        let parsed = Request<ClientApplication>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testClientApplicationRequestWithInvalidArray() {
        let parsed = Request<ClientApplication>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testClientApplicationRequestWithInvalidDictionary() {
        let parsed = Request<ClientApplication>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Context>

    func testContextRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Context.json")
        let parsed = Request<Context>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testContextRequestWithInvalidArray() {
        let parsed = Request<Context>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testContextRequestWithInvalidDictionary() {
        let parsed = Request<Context>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Instance>

    func testInstanceRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Instance.json")
        let parsed = Request<Instance>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testInstanceRequestWithInvalidArray() {
        let parsed = Request<Instance>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testInstanceRequestWithInvalidDictionary() {
        let parsed = Request<Instance>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<LoginSettings>

    func testLoginSettingsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let parsed = Request<LoginSettings>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testLoginSettingsRequestWithInvalidArray() {
        let parsed = Request<LoginSettings>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testLoginSettingsRequestWithInvalidDictionary() {
        let parsed = Request<LoginSettings>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Notification>

    func testNotificationRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notification.json")
        let parsed = Request<MastodonKit.Notification>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testNotificationRequestWithInvalidArray() {
        let parsed = Request<MastodonKit.Notification>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testNotificationRequestWithInvalidDictionary() {
        let parsed = Request<MastodonKit.Notification>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Notification]>

    func testNotificationsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notifications.json")
        let parsed = Request<[MastodonKit.Notification]>.parser(json: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testNotificationsRequestWithEmptyArray() {
        let parsed = Request<[MastodonKit.Notification]>.parser(json: [])

        XCTAssertEqual(parsed?.count, 0)
    }

    func testNotificationsRequestWithInvalidDictionary() {
        let parsed = Request<[MastodonKit.Notification]>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Relationship>

    func testRelationshipRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationship.json")
        let parsed = Request<Relationship>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testRelationshipRequestWithInvalidArray() {
        let parsed = Request<Relationship>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testRelationshipRequestWithInvalidDictionary() {
        let parsed = Request<Relationship>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Relationship]>

    func testRelationshipsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationships.json")
        let parsed = Request<[Relationship]>.parser(json: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testRelationshipsRequestWithEmptyArray() {
        let parsed = Request<[Relationship]>.parser(json: [])

        XCTAssertEqual(parsed?.count, 0)
    }

    func testRelationshipsRequestWithInvalidDictionary() {
        let parsed = Request<[Relationship]>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Report>

    func testReportRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Report.json")
        let parsed = Request<Report>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testReportRequestWithInvalidArray() {
        let parsed = Request<Report>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testReportRequestWithInvalidDictionary() {
        let parsed = Request<Report>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Report]>

    func testReportsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Reports.json")
        let parsed = Request<[Report]>.parser(json: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testReportsRequestWithEmptyArray() {
        let parsed = Request<[Report]>.parser(json: [])

        XCTAssertEqual(parsed?.count, 0)
    }

    func testReportsRequestWithInvalidDictionary() {
        let parsed = Request<[Report]>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Results>

    func testResultsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Results.json")
        let parsed = Request<Results>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testResultsRequestWithInvalidArray() {
        let parsed = Request<Results>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testResultsRequestWithEmptyDictionary() {
        let parsed = Request<Results>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Status>

    func testStatusRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let parsed = Request<Status>.parser(json: fixture)

        XCTAssertNotNil(parsed)
    }

    func testStatusRequestWithInvalidArray() {
        let parsed = Request<Status>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testStatusRequestWithInvalidDictionary() {
        let parsed = Request<Status>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Status]>

    func testTimelineRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let parsed = Request<[Status]>.parser(json: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testTimelineRequestWithEmptyArray() {
        let parsed = Request<[Status]>.parser(json: [])

        XCTAssertEqual(parsed?.count, 0)
    }

    func testTimelineRequestWithInvalidDictionary() {
        let parsed = Request<[Status]>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<[String]>

    func testDomainBlocksRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/DomainBlocks.json")
        let parsed = Request<[String]>.parser(json: fixture)

        XCTAssertEqual(parsed?.count, 3)

        XCTAssertTrue(parsed!.contains("toto"))
        XCTAssertTrue(parsed!.contains("foo"))
        XCTAssertTrue(parsed!.contains("bar"))
    }

    func testDomainBlocksRequestWithEmptyArray() {
        let parsed = Request<[String]>.parser(json: [])

        XCTAssertEqual(parsed?.count, 0)
    }

    func testDomainBlocksRequestWithInvalidDictionary() {
        let parsed = Request<[String]>.parser(json: [:])

        XCTAssertNil(parsed)
    }

    // MARK: Request<Empty>

    func testEmptyRequestWithEmptyDictionary() {
        let parsed = Request<Empty>.parser(json: [:])

        XCTAssertNotNil(parsed)
    }

    func testEmptyRequestWithNonEmptyDictionary() {
        let parsed = Request<Empty>.parser(json: ["foo": "bar"])

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithNonEmptyArray() {
        let parsed = Request<Empty>.parser(json: ["foo"])

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithEmptyArray() {
        let parsed = Request<Empty>.parser(json: [])

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithEmptyString() {
        let parsed = Request<Empty>.parser(json: "")

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithString() {
        let parsed = Request<Empty>.parser(json: "foo")

        XCTAssertNil(parsed)
    }
}
