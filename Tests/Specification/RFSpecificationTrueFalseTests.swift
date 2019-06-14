// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import XCTest
@testable import RadiantForms

class RFSpecificationTrueFalseTests: XCTestCase {
	
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
