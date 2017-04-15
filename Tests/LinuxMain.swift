import XCTest
@testable import MastodonKitTests

XCTMain([
    testCase(AccountsTests.allTests),
    testCase(BlocksTests.allTests),
    testCase(FavouritesTests.allTests),
    testCase(FollowRequestsTests.allTests),
    testCase(HTTPMethodTests.allTests),
    testCase(InstancesTests.allTests),
    testCase(MutesTests.allTests),
    testCase(NotificationsTests.allTests),
    testCase(ReportsTests.allTests),
    testCase(SearchTests.allTests),
    testCase(StatusesTests.allTests),
    testCase(TimelinesTests.allTests)
])
