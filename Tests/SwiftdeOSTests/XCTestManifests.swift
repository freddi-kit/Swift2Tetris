import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftdeOSTests.allTests),
        testCase(GateTest.allTests),
        // testCase(PlexorTest.allTests),
        testCase(ALUTest.allTests),
    ]
}
#endif
