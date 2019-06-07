// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

class RFObtainTitleWidth: FormItemVisitor {
	var width: CGFloat = 0

	func visit(object: TextFieldFormItem) {
		width = object.obtainTitleWidth()
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

class RFAssignTitleWidth: FormItemVisitor {
	fileprivate var width: CGFloat = 0

	init(width: CGFloat) {
		self.width = width
	}

	func visit(object: TextFieldFormItem) {
		object.assignTitleWidth(width)
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

@available(*, unavailable, renamed: "RFObtainTitleWidth")
typealias ObtainTitleWidth = RFObtainTitleWidth

@available(*, unavailable, renamed: "RFAssignTitleWidth")
typealias AssignTitleWidth = RFAssignTitleWidth
