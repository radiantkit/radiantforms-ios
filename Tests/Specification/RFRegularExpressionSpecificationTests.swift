// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import XCTest
@testable import RadiantForms

class RFRegularExpressionSpecificationTests: XCTestCase {
	
	func testSimple() {
		let spec = RFRegularExpressionSpecification(pattern: "^\\d+$")
		XCTAssertTrue(spec.isSatisfiedBy("123"))
		XCTAssertFalse(spec.isSatisfiedBy("abc"))
		XCTAssertFalse(spec.isSatisfiedBy(nil))
	}
	
}
