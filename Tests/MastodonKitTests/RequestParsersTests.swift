//
//  RequestParsersTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

typealias ParserFunctionType<Model> = (Data) -> Model?

class RequestParsersTests: XCTestCase {
    // MARK: Request<Account>

    func testAccountRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Account.json")
        let parsed = try? Account.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAccountRequestWithInvalidData() {
        let parsed = try? Account.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Account]>

    func testAccountsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Accounts.json")
        let parsed = try? [Account].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testAccountsRequestWithInvalidData() {
        let parsed = try? [Account].decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Attachment>

    func testAttachmentRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Attachment.json")
        let parsed = try? Attachment.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testAttachmentRequestWithInvalidData() {
        let parsed = try? Attachment.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Card>

    func testCardRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Card.json")
        let parsed = try? Card.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testCardRequestWithInvalidData() {
        let parsed = try? Card.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<ClientApplication>

    func testClientApplicationRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/ClientApplication.json")
        let parsed = try? ClientApplication.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testClientApplicationRequestWithInvalidData() {
        let parsed = try? ClientApplication.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Context>

    func testContextRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Context.json")
        let parsed = try? Context.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testContextRequestWithInvalidData() {
        let parsed = try? Context.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Instance>

    func testInstanceRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Instance.json")
        let parsed = try? Instance.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testInstanceRequestWithInvalidData() {
        let parsed = try? Instance.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<LoginSettings>

    func testLoginSettingsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/LoginSettings.json")
        let parsed = try? LoginSettings.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testLoginSettingsRequestWithInvalidData() {
        let parsed = try? LoginSettings.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Notification>

    func testNotificationRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notification.json")
        let parsed = try? MastodonKit.Notification.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testNotificationRequestWithInvalidData() {
        let parsed = try? MastodonKit.Notification.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Notification]>

    func testNotificationsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Notifications.json")
        let parsed = try? [MastodonKit.Notification].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testNotificationsRequestWithInvalidData() {
        let parsed = try? [MastodonKit.Notification].decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Relationship>

    func testRelationshipRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationship.json")
        let parsed = try? Relationship.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testRelationshipRequestWithInvalidData() {
        let parsed = try? Relationship.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Relationship]>

    func testRelationshipsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Relationships.json")
        let parsed = try? [Relationship].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testRelationshipsRequestWithInvalidData() {
        let parsed = try? [Relationship].decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Report>

    func testReportRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Report.json")
        let parsed = try? Report.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testReportRequestWithInvalidData() {
        let parsed = try? Report.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Report]>

    func testReportsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Reports.json")
        let parsed = try? [Report].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testReportsRequestWithInvalidData() {
        let parsed = try? [Report].decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Results>

    func testResultsRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Results.json")
        let parsed = try? Results.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testResultsRequestWithInvalidData() {
        let parsed = try? Results.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Status>

    func testStatusRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/StatusWithoutNull.json")
        let parsed = try? Status.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testStatusRequestWithInvalidData() {
        let parsed = try? Status.decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<[Status]>

    func testTimelineRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Timeline.json")
        let parsed = try? [Status].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 2)
    }

    func testTimelineRequestWithInvalidData() {
        let parsed = try? [Status].decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<[String]>

    func testDomainBlocksRequest() {
        let fixture = try! Fixture.load(fileName: "Fixtures/DomainBlocks.json")
        let parsed = try? [String].decode(data: fixture)

        XCTAssertEqual(parsed?.count, 3)

        XCTAssertTrue(parsed!.contains("toto"))
        XCTAssertTrue(parsed!.contains("foo"))
        XCTAssertTrue(parsed!.contains("bar"))
    }

    func testDomainBlocksRequestWithInvalidData() {
        let parsed = try? [String].decode(data: Data())

        XCTAssertNil(parsed)
    }

    // MARK: Request<Empty>

    func testEmptyRequestEmpty() {
        let fixture = "{}".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNotNil(parsed)
    }

    func testEmptyRequestWithEmptyDictionary() {
        let fixture = "[:]".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithNonEmptyDictionary() {
        let fixture = "[\"foo\": \"bar\"]".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithEmptyString() {
        let fixture = "".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }

    func testEmptyRequestWithString() {
        let fixture = "foo".data(using: .utf8)!
        let parsed = try? Empty.decode(data: fixture)

        XCTAssertNil(parsed)
    }
}
