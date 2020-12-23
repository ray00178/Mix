//
//  SequenceTests.swift
//  
//
//  Created by Ray on 2020/11/27.
//

import XCTest
@testable import Mix

final class SequenceTests: XCTestCase {

    static var allTests = [
        ("test_unique", test_unique)
    ]
        
    func test_unique() {
        let array: [Int] = [1, 1, 1, 1, 2, 3, 3, 4, 4, 4, 5, 6, 6, 7, 7]
        XCTAssertEqual(array.unique(), [1, 2, 3, 4, 5, 6, 7])
    }
}
