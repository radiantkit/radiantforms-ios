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

        builder += alertButtonSectionHeader
		builder += alertButton0
		builder += alertButton1
        
        builder += SectionHeaderTitleFormItem().title("Style")
        builder += style
	}

    // MARK: - Toggle Buttons
    
    lazy var toggleButton0: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Toggle Button 0"
        instance.action = { [weak self] in
            guard let buttonFormItem: ButtonFormItem = self?.alertButton0 else {
                return
            }
            buttonFormItem.isHidden = !buttonFormItem.isHidden
            self?.alertButtonSectionHeader_isHidden_refresh()
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
            self?.alertButtonSectionHeader_isHidden_refresh()
            self?.reloadForm()
        }
        return instance
    }()
    
    // MARK: - Alert Buttons
    
    lazy var alertButtonSectionHeader: SectionHeaderTitleFormItem = {
        return SectionHeaderTitleFormItem().title("Alert Buttons")
    }()
    
    func alertButtonSectionHeader_isHidden_refresh() {
        let isHidden0: Bool = alertButton0.isHidden
        let isHidden1: Bool = alertButton1.isHidden
        alertButtonSectionHeader.isHidden = isHidden0 && isHidden1
    }
    
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
    
    // MARK: - Style Picker

    lazy var style: OptionPickerFormItem = {
        let instance = OptionPickerFormItem()
        instance.title("Style").placeholder("required")
        instance.append("Light", identifier: "light")
        instance.append("Gray", identifier: "gray")
        instance.selectOptionWithIdentifier("gray")
        instance.valueDidChange = { [weak self] (selected: OptionRowModel?) in
            self?.style_valueDidChange(selected)
        }
        return instance
    }()
    
    func style_valueDidChange(_ optionRowModel: OptionRowModel?) {
        guard let optionRowModel: OptionRowModel = optionRowModel else {
            print("ERROR: Expected optionRowModel to be non-nil, but got nil")
            return
        }
        let styleId: String = optionRowModel.identifier
        print("update styleId: \(styleId)")
        switch styleId {
        case "light":
            self.alertButton0.isHidden = true
            self.alertButton1.isHidden = true
            self.alertButtonSectionHeader_isHidden_refresh()
            self.reloadForm()
        case "gray":
            self.alertButton0.isHidden = false
            self.alertButton1.isHidden = false
            self.alertButtonSectionHeader_isHidden_refresh()
            self.reloadForm()
        default:
            ()
        }
    }
}
