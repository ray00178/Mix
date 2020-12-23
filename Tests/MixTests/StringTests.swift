//
//  StringTests.swift
//  
//
//  Created by Ray on 2020/11/27.
//

import XCTest
@testable import Mix

final class StringTests: XCTestCase {

    static var allTests = [
        ("test_string_isNotEmpty", test_string_isNotEmpty),
        ("test_string_convert_to_data", test_string_convert_to_data),
        ("test_string_convert_to_dictionary", test_string_convert_to_dictionary)
    ]
        
    func test_string_isNotEmpty() {
        let str: String = ""
        XCTAssertFalse(str.isNotEmpty, "string is empty")
        
        let str1: String = "Hello"
        XCTAssertTrue(str1.isNotEmpty, "string is not empty")
        
        let str2: String? = nil
        XCTAssertNil(str2?.isNotEmpty, "string is nil")
    }
    
    func test_string_convert_to_data() {
        let str: String = ""
        XCTAssertNotNil(str.data, "convert to data is not nil")
        
        let str1: String = "Hello"
        XCTAssertNotNil(str1.data, "convert to data is not nil")
        
        let str2: String? = nil
        XCTAssertNil(str2?.data, "convert to data is not nil")
    }
    
    func test_string_convert_to_dictionary() {
        let str = ""
        XCTAssertNil(str.dictionary, "convert to dictionary is nil")
        
        let str1: String = "Hello"
        XCTAssertNil(str1.dictionary, "convert to dictionary is nil")
        
        let str2: String? = nil
        XCTAssertNil(str2?.dictionary, "convert to dictionary is nil")
        
        let str3: String = """
        {
            "name": "Ray",
            "age": 30,
            "gender": "male",
            "hobbies": ["singing", "travelling", "capmping"]
        }
        """
        XCTAssertTrue(str3.dictionary?["name"] is String, "name value is string type")
        XCTAssertTrue(str3.dictionary?["age"] is Int, "name value is Int type")
        XCTAssertTrue(str3.dictionary?["gender"] is String, "gender value is string type")
        XCTAssertTrue(str3.dictionary?["hobbies"] is Array<String>, "hobbies value is array type")
    }
    
    func test_substring() {
        let demo = "0123456789"
        
        XCTAssertEqual(demo.substring(from: 0, to: 3), "0123")
        XCTAssertEqual(demo.substring(from: 4, to: 7), "4567")
        XCTAssertEqual(demo.substring(from: 1, to: 1), "1")
        
        XCTAssertEqual(demo.substring(from: 1, to: 0), "0123456789")
        XCTAssertEqual(demo.substring(from: -1, to: 0), "0123456789")
        XCTAssertEqual(demo.substring(from: 0, to: 10), "0123456789")
    }
    
    func test_check_equal() {
        let demo = "0123456789"
        
        XCTAssertTrue(demo.checkEqual("0", on: 0))
        XCTAssertTrue(demo.checkEqual("7", on: 7))
        XCTAssertTrue(demo.checkEqual("9", on: 9))
        
        XCTAssertFalse(demo.checkEqual("1", on: 10))
        XCTAssertFalse(demo.checkEqual("2", on: 0))
        XCTAssertFalse(demo.checkEqual("6", on: -1))
    }
}
