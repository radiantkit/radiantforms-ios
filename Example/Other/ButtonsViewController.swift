// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class ButtonsViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Buttons"
		builder.toolbarMode = .none
		builder += RFSectionHeaderTitleFormItem().title("Toggle Buttons")
        builder += toggleButton0
        builder += toggleButton1
        builder += toggleButton2

        builder += alertButtonSectionHeader
		builder += alertButton0
		builder += alertButton1
        builder += alertButton2
        
        builder += RFSectionHeaderTitleFormItem().title("Style")
        builder += style
	}
    
    override func postPopulate(_ builder: RFFormBuilder) {
        // Configure initially visible/hidden FormItems
        alertButton2.isHidden = true
    }

    // MARK: - Toggle Buttons
    
    lazy var toggleButton0: RFButtonFormItem = {
        let instance = RFButtonFormItem()
        instance.title = "Toggle Button 0"
        instance.action = { [weak self] in
            guard let buttonFormItem: RFButtonFormItem = self?.alertButton0 else {
                return
            }
            buttonFormItem.isHidden = !buttonFormItem.isHidden
            self?.alertButtonSectionHeader_isHidden_refresh()
            self?.reloadForm()
        }
        return instance
    }()
    
    lazy var toggleButton1: RFButtonFormItem = {
        let instance = RFButtonFormItem()
        instance.title = "Toggle Button 1"
        instance.action = { [weak self] in
            guard let buttonFormItem: RFButtonFormItem = self?.alertButton1 else {
                return
            }
            buttonFormItem.isHidden = !buttonFormItem.isHidden
            self?.alertButtonSectionHeader_isHidden_refresh()
            self?.reloadForm()
        }
        return instance
    }()
    
    lazy var toggleButton2: RFButtonFormItem = {
        let instance = RFButtonFormItem()
        instance.title = "Toggle Button 2"
        instance.action = { [weak self] in
            guard let buttonFormItem: RFButtonFormItem = self?.alertButton2 else {
                return
            }
            buttonFormItem.isHidden = !buttonFormItem.isHidden
            self?.alertButtonSectionHeader_isHidden_refresh()
            self?.reloadForm()
        }
        return instance
    }()
    
    // MARK: - Alert Buttons
    
    lazy var alertButtonSectionHeader: RFSectionHeaderTitleFormItem = {
        return RFSectionHeaderTitleFormItem().title("Alert Buttons")
    }()
    
    func alertButtonSectionHeader_isHidden_refresh() {
        let isHidden0: Bool = alertButton0.isHidden
        let isHidden1: Bool = alertButton1.isHidden
        let isHidden2: Bool = alertButton2.isHidden
        alertButtonSectionHeader.isHidden = isHidden0 && isHidden1 && isHidden2
    }
    
    lazy var alertButton0: RFButtonFormItem = {
        let instance = RFButtonFormItem()
        instance.title = "Button 0"
        instance.action = { [weak self] in
            self?.rf_simpleAlert("Button 0", "Button clicked")
        }
        return instance
    }()
    
    lazy var alertButton1: RFButtonFormItem = {
        let instance = RFButtonFormItem()
        instance.title = "Button 1"
        instance.action = { [weak self] in
            self?.rf_simpleAlert("Button 1", "Button clicked")
        }
        return instance
    }()
    
    lazy var alertButton2: RFButtonFormItem = {
        let instance = RFButtonFormItem()
        instance.title = "Button 2"
        instance.action = { [weak self] in
            self?.rf_simpleAlert("Button 2", "Button clicked")
        }
        return instance
    }()
    
    // MARK: - Style Picker

    lazy var style: RFOptionPickerFormItem = {
        let instance = RFOptionPickerFormItem()
        instance.title("Style").placeholder("required")
        instance.append("None", identifier: "none")
        instance.append("All", identifier: "all")
        instance.selectOptionWithIdentifier("all")
        instance.valueDidChange = { [weak self] (selected: RFOptionRowModel?) in
            self?.style_valueDidChange(selected)
        }
        return instance
    }()
    
    func style_valueDidChange(_ optionRowModel: RFOptionRowModel?) {
        guard let optionRowModel: RFOptionRowModel = optionRowModel else {
            print("ERROR: Expected optionRowModel to be non-nil, but got nil")
            return
        }
        let styleId: String = optionRowModel.identifier
        print("update styleId: \(styleId)")
        switch styleId {
        case "none":
            self.alertButton0.isHidden = true
            self.alertButton1.isHidden = true
            self.alertButton2.isHidden = true
            self.alertButtonSectionHeader_isHidden_refresh()
            self.reloadForm()
        case "all":
            self.alertButton0.isHidden = false
            self.alertButton1.isHidden = false
            self.alertButton2.isHidden = false
            self.alertButtonSectionHeader_isHidden_refresh()
            self.reloadForm()
        default:
            ()
        }
    }
}
