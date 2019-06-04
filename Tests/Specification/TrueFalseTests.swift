// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import XCTest
@testable import SwiftyFORM

class TrueFalseTests: XCTestCase {
	
	func testTrue() {
		let spec = RFTrueSpecification()
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy(nil))
	}
	
	func testFalse() {
		let spec = RFFalseSpecification()
		XCTAssertFalse(spec.isSatisfiedBy("world hello"))
		XCTAssertFalse(spec.isSatisfiedBy(nil))
	}
	
}
