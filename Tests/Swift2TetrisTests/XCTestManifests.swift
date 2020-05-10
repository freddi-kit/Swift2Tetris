import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Swift2TetrisTests.allTests),
        testCase(GateTest.allTests),
        testCase(PlexorTest.allTests),
        testCase(ALUTest.allTests),
        testCase(RAMTest.allTests),
        testCase(ProgramCounterTest.allTests),
        testCase(CPUTest.allTests),
    ]
}
#endif
