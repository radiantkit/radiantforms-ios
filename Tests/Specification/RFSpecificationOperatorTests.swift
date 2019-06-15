// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import XCTest
@testable import RadiantForms

class RFSpecificationOperatorTests: XCTestCase {
	
	func testOperator0() {
		/*
		This specification checks these contraints
		1. the string must be all digits
		2. the string.length must be between 2..4
		3. the string must not contain two zeroes
		*/
		let onlyDigits = RFCharacterSetSpecification.decimalDigits
		let between2And4Letters = RFRegularExpressionSpecification(pattern: "^.{2,4}$")
		let twoZeroes = RFRegularExpressionSpecification(pattern: "0.*0")
		
		let spec = onlyDigits & between2And4Letters & !twoZeroes
		
		XCTAssertTrue(spec == "42")
		XCTAssertTrue(spec == "0123")
		XCTAssertTrue(spec == "666")
		XCTAssertFalse(spec == "ice")
		XCTAssertFalse(spec == "too long")
		XCTAssertFalse(spec == "00")
		XCTAssertFalse(spec == "1010")
		
		XCTAssertFalse(spec != "42")
		XCTAssertFalse(spec != "0123")
		XCTAssertFalse(spec != "666")
		XCTAssertTrue(spec != "ice")
		XCTAssertTrue(spec != "too long")
		XCTAssertTrue(spec != "00")
		XCTAssertTrue(spec != "1010")
	}
	
}
