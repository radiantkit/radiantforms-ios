// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import RadiantForms

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
