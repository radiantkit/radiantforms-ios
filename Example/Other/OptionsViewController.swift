// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class OptionsViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Options"
		builder.toolbarMode = .none
		builder += RFSectionHeaderTitleFormItem().title("Options")
		builder += adoptBitcoin
		builder += exploreSpace
		builder += worldPeace
		builder += stopGlobalWarming
		builder += RFSectionFormItem()
		builder += randomizeButton
	}

	lazy var adoptBitcoin: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("Adopt Bitcoin?").placeholder("required")
		instance.append("Strongly disagree").append("Disagree").append("Neutral").append("Agree").append("Strongly agree")
		instance.selectOptionWithTitle("Neutral")
		instance.valueDidChange = { (selected: RFOptionRowModel?) in
			print("adopt bitcoin: \(String(describing: selected))")
		}
		return instance
		}()

	lazy var exploreSpace: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("Explore Space?").placeholder("required")
		instance.append("Strongly disagree").append("Disagree").append("Neutral").append("Agree").append("Strongly agree")
		instance.selectOptionWithTitle("Neutral")
		instance.valueDidChange = { (selected: RFOptionRowModel?) in
			print("explore space: \(String(describing: selected))")
		}
		return instance
		}()

	lazy var worldPeace: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("World Peace?").placeholder("required")
		instance.append("Strongly disagree").append("Disagree").append("Neutral").append("Agree").append("Strongly agree")
		instance.selectOptionWithTitle("Neutral")
		instance.valueDidChange = { (selected: RFOptionRowModel?) in
			print("world peace: \(String(describing: selected))")
		}
		return instance
		}()

	lazy var stopGlobalWarming: RFOptionPickerFormItem = {
		let instance = RFOptionPickerFormItem()
		instance.title("Stop Global Warming?").placeholder("required")
		instance.append("Strongly disagree", identifier: "strongly_disagree")
		instance.append("Disagree", identifier: "disagree")
		instance.append("Neutral", identifier: "neutral")
		instance.append("Agree", identifier: "agree")
		instance.append("Strongly agree", identifier: "strongly_agree")
		instance.selectOptionWithIdentifier("neutral")
		instance.valueDidChange = { (selected: RFOptionRowModel?) in
			print("stop global warming: \(String(describing: selected))")
		}
		return instance
		}()

	lazy var randomizeButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Randomize"
		instance.action = { [weak self] in
			self?.randomize()
		}
		return instance
		}()

	func assignRandomOption(_ optionField: RFOptionPickerFormItem) {
		var selected: RFOptionRowModel? = nil
		let options = optionField.options
		if options.count > 0 {
			let i = randomInt(0, options.count)
			if i < options.count {
				selected = options[i]
			}
		}
		optionField.selected = selected
	}

	func randomize() {
		assignRandomOption(adoptBitcoin)
		assignRandomOption(exploreSpace)
		assignRandomOption(worldPeace)
		assignRandomOption(stopGlobalWarming)
	}
}
