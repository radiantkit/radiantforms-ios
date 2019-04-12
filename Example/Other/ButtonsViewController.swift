// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class ButtonsViewController: FormViewController {
	override func populate(_ builder: FormBuilder) {
		builder.navigationTitle = "Buttons"
		builder.toolbarMode = .none
		builder += SectionHeaderTitleFormItem().title("Toggle Buttons")
        builder += toggleButton0
        builder += toggleButton1

        builder += SectionHeaderTitleFormItem().title("Alert Buttons")
		builder += alertButton0
		builder += alertButton1
        
        builder += SectionHeaderTitleFormItem().title("Style")
        builder += style
	}

    lazy var toggleButton0: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Toggle Button 0"
        instance.action = { [weak self] in
            guard let buttonFormItem: ButtonFormItem = self?.alertButton0 else {
                return
            }
            buttonFormItem.isHidden = !buttonFormItem.isHidden
            self?.reloadForm()
        }
        return instance
    }()
    
    lazy var toggleButton1: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Toggle Button 1"
        instance.action = { [weak self] in
            guard let buttonFormItem: ButtonFormItem = self?.alertButton1 else {
                return
            }
            buttonFormItem.isHidden = !buttonFormItem.isHidden
            self?.reloadForm()
        }
        return instance
    }()
    
    lazy var alertButton0: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Button 0"
        instance.action = { [weak self] in
            self?.form_simpleAlert("Button 0", "Button clicked")
        }
        return instance
    }()
    
    lazy var alertButton1: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Button 1"
        instance.action = { [weak self] in
            self?.form_simpleAlert("Button 1", "Button clicked")
        }
        return instance
    }()

    lazy var style: OptionPickerFormItem = {
        let instance = OptionPickerFormItem()
        instance.title("Style").placeholder("required")
        instance.append("Light").append("Gray").append("Dark")
        instance.selectOptionWithTitle("Gray")
        return instance
    }()
}
