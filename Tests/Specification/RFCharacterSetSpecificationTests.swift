// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import XCTest
@testable import SwiftyFORM

class RFCharacterSetSpecificationTests: XCTestCase {
	
	func testCharactersInString() {
		let spec = RFCharacterSetSpecification.charactersInString("abc")
		XCTAssertTrue(spec.isSatisfiedBy(""))
		XCTAssertTrue(spec.isSatisfiedBy("abc"))
		XCTAssertFalse(spec.isSatisfiedBy("0123hello"))
		XCTAssertFalse(spec.isSatisfiedBy("hello"))
	}

	func testDecimalDigits() {
		let spec = RFCharacterSetSpecification.decimalDigits
		XCTAssertTrue(spec.isSatisfiedBy(""))
		XCTAssertTrue(spec.isSatisfiedBy("0123456789"))
		XCTAssertFalse(spec.isSatisfiedBy("0123hello"))
		XCTAssertFalse(spec.isSatisfiedBy("hello"))
	}
	
	func testWhitespacesAndNewlines() {
		let spec = RFCharacterSetSpecification.whitespacesAndNewlines
		XCTAssertTrue(spec.isSatisfiedBy(""))
		XCTAssertTrue(spec.isSatisfiedBy(" \t \n "))
		XCTAssertFalse(spec.isSatisfiedBy("---"))
		XCTAssertFalse(spec.isSatisfiedBy("###"))
	}
}
