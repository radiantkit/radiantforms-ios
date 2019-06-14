// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import XCTest
@testable import RadiantForms

class RFValidatorTests: XCTestCase {

    func testExample() {
		let builder = RFValidatorBuilder()
		builder.hardValidate(RFFalseSpecification(), message: "rule0")
		let validator = builder.build()
		let actual: RFValidateResult = validator.validate("hello", checkHardRule: true, checkSoftRule: true, checkSubmitRule: true)
		let expected = RFValidateResult.hardInvalid(message: "rule0")
		XCTAssertEqual(expected, actual)
    }

}
