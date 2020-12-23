//
//  OptionalTests.swift
//  
//
//  Created by Ray on 2020/11/27.
//

import XCTest
@testable import Mix

final class OptionalTests: XCTestCase {

    static var allTests = [
        ("test_Optional", test_Optional)
    ]
        
    func test_Optional() {
        let int: Int? = nil
        XCTAssertTrue(int.isNil, "int is nil")
        XCTAssertFalse(int.isNotNil, "int is not nil")
        XCTAssertTrue(int.isNilSet(0) == 0)
        
        let double: Double? = 0.0
        XCTAssertTrue(double.isNotNil, "double is not nil")
        XCTAssertFalse(double.isNil, "double is not nil")
        XCTAssertTrue(double.isNilSet(100.0) == 0.0)
        
        var str: String? = "Mix"
        XCTAssertTrue(str.isNotNil, "str is not nil")
        XCTAssertFalse(str.isNil, "str is not nil")
        
        str = nil
        XCTAssertTrue(str.isNilSet("empty") == "empty")
    }
}
