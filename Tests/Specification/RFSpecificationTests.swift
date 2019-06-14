// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import XCTest
@testable import RadiantForms

class RFSpecificationTests: XCTestCase {
    
	func testAnd() {
		let spec0 = RFRegularExpressionSpecification(pattern: "^hello")
		let spec1 = RFRegularExpressionSpecification(pattern: "world$")
		let spec = spec0.and(spec1)
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello swift world"))
		XCTAssertFalse(spec.isSatisfiedBy("world hello"))
		XCTAssertFalse(spec.isSatisfiedBy("xyz hello world xzy"))
	}
	
	func testOr() {
		let spec0 = RFRegularExpressionSpecification(pattern: "hello")
		let spec1 = RFRegularExpressionSpecification(pattern: "world")
		let spec = spec0.or(spec1)
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello"))
		XCTAssertTrue(spec.isSatisfiedBy("world"))
		XCTAssertFalse(spec.isSatisfiedBy("johndoe"))
	}
	
	func testNot() {
		let spec0 = RFRegularExpressionSpecification(pattern: "hello")
		let spec = spec0.not()
		XCTAssertFalse(spec.isSatisfiedBy("hello"))
		XCTAssertTrue(spec.isSatisfiedBy("world"))
	}
	
}
