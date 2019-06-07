// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class SlidersAndTextFieldsViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Sliders and TextFields"
		builder.toolbarMode = .simple
		builder += textField0
		builder += PrecisionSliderFormItem().decimalPlaces(0).minimumValue(-100).maximumValue(100).value(0).title("Slider 0").shouldCollapseWhenResigning()
		builder += textField1
		builder += PrecisionSliderFormItem().decimalPlaces(0).minimumValue(-100).maximumValue(100).value(0).title("Slider 1").shouldCollapseWhenResigning()
		builder += textField2
	}

	lazy var textField0: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("TextField 0").placeholder("required")
		instance.keyboardType = .asciiCapable
		instance.autocorrectionType = .no
		return instance
	}()

	lazy var textField1: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("TextField 1").placeholder("required")
		instance.keyboardType = .asciiCapable
		instance.autocorrectionType = .no
		return instance
	}()

	lazy var textField2: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("TextField 2").placeholder("required")
		instance.keyboardType = .asciiCapable
		instance.autocorrectionType = .no
		return instance
	}()
}
