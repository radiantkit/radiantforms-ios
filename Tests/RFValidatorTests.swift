// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import XCTest
@testable import SwiftyFORM

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
