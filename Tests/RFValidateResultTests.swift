// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import XCTest
@testable import SwiftyFORM

class RFValidateResultTests: XCTestCase {

	func testCompare_same0() {
		let a = RFValidateResult.valid
		let b = RFValidateResult.valid
		XCTAssertEqual(a, b)
	}
	
	func testCompare_same1() {
		let a = RFValidateResult.hardInvalid(message: "hello")
		let b = RFValidateResult.hardInvalid(message: "hello")
		XCTAssertEqual(a, b)
	}
	
	func testCompare_same2() {
		let a = RFValidateResult.softInvalid(message: "world")
		let b = RFValidateResult.softInvalid(message: "world")
		XCTAssertEqual(a, b)
	}
	
	func testCompare_different0() {
		let a = RFValidateResult.valid
		let b = RFValidateResult.hardInvalid(message: "goodbye")
		XCTAssertNotEqual(a, b)
	}

	func testCompare_different1() {
		let a = RFValidateResult.hardInvalid(message: "hello")
		let b = RFValidateResult.hardInvalid(message: "goodbye")
		XCTAssertNotEqual(a, b)
	}
	
	func testCompare_different2() {
		let a = RFValidateResult.valid
		let b = RFValidateResult.softInvalid(message: "howdy")
		XCTAssertNotEqual(a, b)
	}

	func testCompare_different3() {
		let a = RFValidateResult.softInvalid(message: "world")
		let b = RFValidateResult.softInvalid(message: "candy")
		XCTAssertNotEqual(a, b)
	}
	
	func testCompare_different4() {
		let a = RFValidateResult.hardInvalid(message: "hello")
		let b = RFValidateResult.softInvalid(message: "candy")
		XCTAssertNotEqual(a, b)
	}
	
}
