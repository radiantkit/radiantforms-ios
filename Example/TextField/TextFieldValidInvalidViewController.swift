// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class TextFieldValidInvalidViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Valid & Invalid"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Shows layouts variants\nof the text field cell\nwhen valid and when invalid")
		builder += RFSectionHeaderTitleFormItem().title("padding before")
		builder += RFStaticTextFormItem().title("Padding 1")
		builder += RFStaticTextFormItem().title("Padding 2")
		builder += RFStaticTextFormItem().title("Padding 3")
		builder += RFStaticTextFormItem().title("Padding 4")
		builder += RFStaticTextFormItem().title("Padding 6")
		builder += RFStaticTextFormItem().title("Padding 7")
		builder += RFSectionHeaderTitleFormItem().title("valid / invalid")
		let t0 = builder.append(RFTextFieldFormItem().title("Valid").placeholder("no message shown"))
		let t1 = builder.append(RFTextFieldFormItem().title("Invalid 1").placeholder("one line")
			.validate(RFFalseSpecification(), message: "Line 1 of 1"))
		let t2 = builder.append(RFTextFieldFormItem().title("Invalid 2").placeholder("two lines")
			.validate(RFFalseSpecification(), message: "Line 1 of 2\nLine 2 of 2"))
		let t3 = builder.append(RFTextFieldFormItem().title("Invalid 3").placeholder("three lines")
			.validate(RFFalseSpecification(), message: "Line 1 of 3\nLine 2 of 3\nLine 3 of 3"))
		builder.alignLeft([t0, t1, t2, t3])
		builder += RFSectionFooterTitleFormItem().title("Footer text")
		builder += RFSectionHeaderTitleFormItem().title("padding after")
		builder += RFStaticTextFormItem().title("Padding 1")
		builder += RFStaticTextFormItem().title("Padding 2")
		builder += RFStaticTextFormItem().title("Padding 3")
		builder += RFStaticTextFormItem().title("Padding 4")
		builder += RFStaticTextFormItem().title("Padding 5")
	}
}
