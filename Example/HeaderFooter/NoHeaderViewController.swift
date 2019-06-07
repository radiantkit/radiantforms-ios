// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import SwiftyFORM

class NoHeaderViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "No Header"
		builder.suppressHeaderForFirstSection = true

		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFSectionFormItem()
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFSectionFormItem()
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
	}
}
