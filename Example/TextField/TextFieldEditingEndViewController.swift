// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class TextFieldEditingEndViewController: RFFormViewController {
    override func populate(_ builder: RFFormBuilder) {
        builder.navigationTitle = "Editing End"
        builder.demo_showInfo("Shows an alert after editing has finished")
        builder += RFSectionHeaderTitleFormItem().title("Write a new nickname")
        builder += textField
    }

	lazy var textField: RFTextFieldFormItem = {
		var instance = RFTextFieldFormItem()
		instance.title = "Nickname"
		instance.placeholder = "Example EvilBot1337"
		instance.autocorrectionType = .no
		instance.textEditingEndBlock = { [weak self] value in
			self?.presentAlert(value)
		}
		return instance
	}()
	
	func presentAlert(_ value: String) {
		let alert = UIAlertController(title: "Editing End Callback", message: "Value is '\(value)'", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
		present(alert, animated: true)
	}
}
