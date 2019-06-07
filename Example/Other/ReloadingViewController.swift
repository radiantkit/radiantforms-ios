// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class ReloadingViewController: RFFormViewController {
	var populateCount = 0

	override func populate(_ builder: RFFormBuilder) {
		populateCount += 1

		builder.navigationTitle = "Reload Form"
		builder.toolbarMode = .none

		builder += RFSectionHeaderTitleFormItem().title("Action")
		builder += reloadButton

		builder += RFSectionHeaderTitleFormItem().title("Populate")
		builder += StaticTextFormItem().title("Number of reloads").value(String(populateCount))

		if populateCount & 1 == 1 {
			builder += RFSectionHeaderTitleFormItem().title("Good")
			builder += StaticTextFormItem().title("Cure cancer")
			builder += StaticTextFormItem().title("World peace")
			builder += StaticTextFormItem().title("Science")
		} else {
			builder += RFSectionHeaderTitleFormItem().title("Bad")
			builder += StaticTextFormItem().title("Ignorance")
			builder += StaticTextFormItem().title("Dictatorship")
			builder += StaticTextFormItem().title("Polution")
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
