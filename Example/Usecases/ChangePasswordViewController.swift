// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class ChangePasswordViewController: RFFormViewController {
	override func loadView() {
		super.loadView()
		form_installSubmitButton()
	}

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Password"
		builder.toolbarMode = .simple
		builder += RFSectionHeaderTitleFormItem().title("Your Old Password")
		builder += passwordOld
		builder += RFSectionHeaderTitleFormItem().title("Your New Password")
		builder += passwordNew
		builder += passwordNewRepeated
		builder.alignLeft([passwordOld, passwordNew, passwordNewRepeated])
	}

	lazy var passwordOld: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("Old password").password().placeholder("required")
		instance.keyboardType = .numberPad
		instance.autocorrectionType = .no
		instance.validate(RFCharacterSetSpecification.decimalDigits, message: "Must be digits")
		instance.submitValidate(RFCountSpecification.min(4), message: "Length must be minimum 4 digits")
		instance.validate(RFCountSpecification.max(6), message: "Length must be maximum 6 digits")
		return instance
		}()

	lazy var passwordNew: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("New password").password().placeholder("required")
		instance.keyboardType = .numberPad
		instance.autocorrectionType = .no
		instance.validate(RFCharacterSetSpecification.decimalDigits, message: "Must be digits")
		instance.submitValidate(RFCountSpecification.min(4), message: "Length must be minimum 4 digits")
		instance.validate(RFCountSpecification.max(6), message: "Length must be maximum 6 digits")
		return instance
		}()

	lazy var passwordNewRepeated: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("Repeat password").password().placeholder("required")
		instance.keyboardType = .numberPad
		instance.autocorrectionType = .no
		instance.validate(RFCharacterSetSpecification.decimalDigits, message: "Must be digits")
		instance.submitValidate(RFCountSpecification.min(4), message: "Length must be minimum 4 digits")
		instance.validate(RFCountSpecification.max(6), message: "Length must be maximum 6 digits")
		return instance
		}()
}
