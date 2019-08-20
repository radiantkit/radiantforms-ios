// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class CustomViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Custom UITableViewCell"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Demonstration of\ncustom cells using\nRFCustomFormItem")

        builder += RFTextFormItem("Please specify your favorite color:")
        builder += colorPicker
        builder += colorSubmitButton
        
		builder += RFSectionHeaderTitleFormItem(title: "World news")
		let loaderItem0 = RFCustomFormItem()
		loaderItem0.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem0

		builder += RFSectionHeaderTitleFormItem().title("Technology news")
		let loaderItem1 = RFCustomFormItem()
		loaderItem1.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem1

		builder += RFSectionHeaderTitleFormItem().title("Game news")
		let loaderItem2 = RFCustomFormItem()
		loaderItem2.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem2

		builder += RFSectionHeaderTitleFormItem().title("Fashion news")
		let loaderItem3 = RFCustomFormItem()
		loaderItem3.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem3

		builder += RFSectionHeaderTitleFormItem().title("Biz news")
		let loaderItem4 = RFCustomFormItem()
		loaderItem4.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem4
	}
    
    // MARK: - Color picker
    
    lazy var colorPicker: RFCustomFormItem = {
        let instance = RFCustomFormItem()
        instance.createCell = { [weak instance] _ in
            let cell = try ColorPickerCell.createCell()
            cell.didPickValue = { [weak instance] (value) in
                guard let strongInstance = instance else {
                    fatalError("Expected instance to be non-nil, but got nil")
                }
                strongInstance.payload = value
            }
            return cell
        }
        return instance
    }()
    
    lazy var colorSubmitButton: RFButtonFormItem = {
        let instance = RFButtonFormItem().title("Submit color")
        instance.action = { [weak self] in
            guard let strongSelf = self else {
                fatalError("Expected self to be non-nil, but got nil")
            }
            guard let color = strongSelf.colorPicker.payload as? ColorPickerCellValue else {
                strongSelf.rf_simpleAlert("Submitted", "No preferred color selected")
                return
            }
            strongSelf.rf_simpleAlert("Submitted", "Selected color is \(color)")
        }
        return instance
    }()
}
