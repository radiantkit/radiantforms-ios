// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

class RFObtainTitleWidth: RFFormItemVisitor {
	var width: CGFloat = 0

	func visit(object: TextFieldFormItem) {
		width = object.obtainTitleWidth()
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

class RFAssignTitleWidth: RFFormItemVisitor {
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

@available(*, unavailable, renamed: "RFObtainTitleWidth")
typealias ObtainTitleWidth = RFObtainTitleWidth

@available(*, unavailable, renamed: "RFAssignTitleWidth")
typealias AssignTitleWidth = RFAssignTitleWidth
