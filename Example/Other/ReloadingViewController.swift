// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class ReloadingViewController: RFFormViewController {
	var populateCount = 0

	override func populate(_ builder: RFFormBuilder) {
		populateCount += 1

		builder.navigationTitle = "Reload Form"
		builder.toolbarMode = .none

		builder += RFSectionHeaderTitleFormItem().title("Action")
		builder += reloadButton

		builder += RFSectionHeaderTitleFormItem().title("Populate")
		builder += RFStaticTextFormItem().title("Number of reloads").value(String(populateCount))

		if populateCount & 1 == 1 {
			builder += RFSectionHeaderTitleFormItem().title("Good")
			builder += RFStaticTextFormItem().title("Cure cancer")
			builder += RFStaticTextFormItem().title("World peace")
			builder += RFStaticTextFormItem().title("Science")
		} else {
			builder += RFSectionHeaderTitleFormItem().title("Bad")
			builder += RFStaticTextFormItem().title("Ignorance")
			builder += RFStaticTextFormItem().title("Dictatorship")
			builder += RFStaticTextFormItem().title("Polution")
		}
	}

	lazy var reloadButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Reload Form"
		instance.action = { [weak self] in
			self?.reloadForm()
		}
		return instance
	}()
}
