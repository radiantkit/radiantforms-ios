// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import XCTest
@testable import SwiftyFORM

class RFJSONHelperTests: XCTestCase {
    func testNil() {
		let value = RFJSONHelper.process(nil)
		XCTAssertTrue(value is NSNull)
    }
    
	func testNSNull() {
		let value = RFJSONHelper.process(NSNull())
		XCTAssertTrue(value is NSNull)
	}
	
	func testNone() {
		let s: String? = nil
		var dict = [String: Any?]()
		dict["id"] = s as Any?
		let obj: Any? = dict as Any?
		
		guard let dict2 = obj as? [String: Any?] else {
			XCTFail()
			return
		}
		let value: Any?? = dict2["id"]
		let processedValue = RFJSONHelper.process(value!)
		XCTAssertTrue(processedValue is NSNull)
	}
	
	func testInteger() {
		let i: Int = 123
		let value = RFJSONHelper.process(i)
		XCTAssertTrue(value is Int)
	}
	
	func testString() {
		let s: String = "hello"
		let value = RFJSONHelper.process(s)
		XCTAssertTrue(value is String)
	}
}
