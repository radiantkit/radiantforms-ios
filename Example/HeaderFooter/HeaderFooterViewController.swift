// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class HeaderFooterViewController: RFFormViewController {

	let headerView0 = RFSectionHeaderViewFormItem()
	let footerView0 = RFSectionFooterViewFormItem()

	override func populate(_ builder: RFFormBuilder) {
		configureHeaderView0()
		configureFooterView0()

		builder.navigationTitle = "Header & Footer"
		builder.demo_showInfo("Demonstration of\nsection headers\nand section footers")
		builder += RFSectionHeaderTitleFormItem().title("Standard Header Title")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFSectionFooterTitleFormItem().title("Standard Footer Title")
		builder += headerView0
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += footerView0
		builder += RFSectionHeaderTitleFormItem().title("Line 1: Standard Header Title\nLine 2: Standard Header Title\nLine 3: Standard Header Title")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFStaticTextFormItem().title("Empty Row")
		builder += RFSectionFooterTitleFormItem(title: "Line 1: Standard Footer Title\nLine 2: Standard Footer Title\nLine 3: Standard Footer Title")
	}

	func configureHeaderView0() {
		headerView0.viewBlock = {
			return RFInfoView(frame: CGRect(x: 0, y: 0, width: 0, height: 75), text: "Custom\nHeader\nView")
		}
	}

	func configureFooterView0() {
		footerView0.viewBlock = {
			return RFInfoView(frame: CGRect(x: 0, y: 0, width: 0, height: 75), text: "Custom\nFooter\nView")
		}
	}
}
