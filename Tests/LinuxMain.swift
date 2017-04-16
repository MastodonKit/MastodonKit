import XCTest
@testable import MastodonKitTests

XCTMain([
    testCase(AccountsTests.allTests),
    testCase(BlocksTests.allTests),
    testCase(FavouritesTests.allTests),
    testCase(FollowRequestsTests.allTests),
    testCase(InstancesTests.allTests),
    testCase(MutesTests.allTests),
    testCase(NotificationsTests.allTests),
    testCase(ReportsTests.allTests),
    testCase(SearchTests.allTests),
    testCase(StatusesTests.allTests),
    testCase(TimelinesTests.allTests),
    testCase(HTTPMethodTests.allTests),
    testCase(AccountTests.allTests),
    testCase(ApplicationTests.allTests),
    testCase(AttachmentTests.allTests),
    testCase(CardTests.allTests),
    testCase(ContextTests.allTests),
    testCase(InstanceTests.allTests),
    testCase(MentionTests.allTests),
    testCase(NotificationTests.allTests),
    testCase(RelationshipTests.allTests),
    testCase(ReportTests.allTests),
    testCase(RequestErrorTests.allTests),
    testCase(ResourcesTests.allTests),
    testCase(ResultsTests.allTests),
    testCase(StatusTests.allTests),
    testCase(TagTests.allTests)
])
