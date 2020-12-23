import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        //testCase(MixTests.allTests),
        testCase(StringTests.allTests),
        testCase(OptionalTests.allTests),
        testCase(SequenceTests.allTests)
    ]
}
#endif
