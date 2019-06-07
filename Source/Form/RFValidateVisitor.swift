// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

class RFValidateVisitor: RFFormItemVisitor {
	var result = RFValidateResult.valid

	func visit(object: TextFieldFormItem) {
		result = object.submitValidateValueText()
	}

    func visit(object: RFAmountFormItem) {}
	func visit(object: RFAttributedTextFormItem) {}
	func visit(object: RFButtonFormItem) {}
	func visit(object: RFCustomFormItem) {}
	func visit(object: RFDatePickerFormItem) {}
	func visit(object: RFMetaFormItem) {}
	func visit(object: RFOptionPickerFormItem) {}
	func visit(object: OptionRowFormItem) {}
	func visit(object: RFPickerViewFormItem) {}
	func visit(object: PrecisionSliderFormItem) {}
	func visit(object: RFSectionFooterTitleFormItem) {}
	func visit(object: RFSectionFooterViewFormItem) {}
	func visit(object: RFSectionFormItem) {}
	func visit(object: RFSectionHeaderTitleFormItem) {}
	func visit(object: RFSectionHeaderViewFormItem) {}
	func visit(object: RFSegmentedControlFormItem) {}
	func visit(object: RFSliderFormItem) {}
	func visit(object: StaticTextFormItem) {}
	func visit(object: StepperFormItem) {}
	func visit(object: SwitchFormItem) {}
	func visit(object: TextViewFormItem) {}
	func visit(object: ViewControllerFormItem) {}
}

@available(*, unavailable, renamed: "RFValidateVisitor")
typealias ValidateVisitor = RFValidateVisitor
