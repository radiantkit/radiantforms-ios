// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

class RFValidateVisitor: FormItemVisitor {
	var result = RFValidateResult.valid

	func visit(object: TextFieldFormItem) {
		result = object.submitValidateValueText()
	}

    func visit(object: RFAmountFormItem) {}
	func visit(object: RFAttributedTextFormItem) {}
	func visit(object: RFButtonFormItem) {}
	func visit(object: RFCustomFormItem) {}
	func visit(object: RFDatePickerFormItem) {}
	func visit(object: MetaFormItem) {}
	func visit(object: OptionPickerFormItem) {}
	func visit(object: OptionRowFormItem) {}
	func visit(object: PickerViewFormItem) {}
	func visit(object: PrecisionSliderFormItem) {}
	func visit(object: SectionFooterTitleFormItem) {}
	func visit(object: SectionFooterViewFormItem) {}
	func visit(object: SectionFormItem) {}
	func visit(object: SectionHeaderTitleFormItem) {}
	func visit(object: SectionHeaderViewFormItem) {}
	func visit(object: SegmentedControlFormItem) {}
	func visit(object: SliderFormItem) {}
	func visit(object: StaticTextFormItem) {}
	func visit(object: StepperFormItem) {}
	func visit(object: SwitchFormItem) {}
	func visit(object: TextViewFormItem) {}
	func visit(object: ViewControllerFormItem) {}
}

@available(*, unavailable, renamed: "RFValidateVisitor")
typealias ValidateVisitor = RFValidateVisitor
