// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class SettingsViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Settings"
		builder.toolbarMode = .none
		builder += RFSectionHeaderTitleFormItem().title("Options")
		builder += server
		builder += theme
		builder += logging
		builder += RFSectionHeaderTitleFormItem().title("Actions")
		builder += resetUserDefaultsButton
		builder += deleteCacheButton
	}

	lazy var server: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("Server").placeholder("required")
		instance.append("Production").append("Staging1").append("Staging2")
		instance.selectOptionWithTitle("Production")
		return instance
	}()

	lazy var theme: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("Theme").placeholder("required")
		instance.append("Bright").append("Hipster").append("Dark")
		instance.selectOptionWithTitle("Bright")
		return instance
	}()

	lazy var logging: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("Logging").placeholder("required")
		instance.append("Disabled").append("Compact").append("Verbose")
		instance.selectOptionWithTitle("Verbose")
		return instance
	}()

	lazy var resetUserDefaultsButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Reset UserDefaults"
		instance.action = { [weak self] in
			self?.rf_simpleAlert("Reset UserDefaults", "Button clicked")
		}
		return instance
	}()

	lazy var deleteCacheButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Delete Cache"
		instance.action = { [weak self] in
			self?.rf_simpleAlert("Delete Cache", "Button clicked")
		}
		return instance
	}()
}
