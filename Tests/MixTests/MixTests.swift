import XCTest
import class Foundation.Bundle
@testable import Mix

final class MixTests: XCTestCase {
    
    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

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
    
    // MARK: - Test Optional
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
    
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//
//        // Some of the APIs that we use below are available in macOS 10.13 and above.
//        guard #available(macOS 10.13, *) else {
//            return
//        }
//
//        let fooBinary = productsDirectory.appendingPathComponent("Mix")
//
//        let process = Process()
//        process.executableURL = fooBinary
//
//        let pipe = Pipe()
//        process.standardOutput = pipe
//
//        try process.run()
//        process.waitUntilExit()
//
//        let data = pipe.fileHandleForReading.readDataToEndOfFile()
//        let output = String(data: data, encoding: .utf8)
//
//        XCTAssertEqual(output, "Hello, world!\n")
//    }

    
}
