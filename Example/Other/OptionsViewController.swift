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
        builder += cureDiseases
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
        instance.append("Strongly disagree", identifier: "strongly_disagree")
        instance.append("Disagree", identifier: "disagree")
        instance.append("Neutral", identifier: "neutral")
        instance.append("Agree", identifier: "agree")
        instance.append("Strongly agree", identifier: "strongly_agree")
        instance.selectOptionWithIdentifier("neutral")
		instance.valueDidChange = { (selected: RFOptionRowModel?) in
			print("world peace: \(String(describing: selected))")
		}
		return instance
		}()

	lazy var stopGlobalWarming: RFOptionPickerFormItem = {
        // Payloads is copy by reference
        typealias MyDictionary = [String: Any]
        let payload_stronglyDisagree: MyDictionary = ["opinion": "I strongly disagree"]
        let payload_disagree: MyDictionary = ["opinion": "I disagree"]
        let payload_neutral: MyDictionary = ["opinion": "I'm neutral"]
        let payload_agree: MyDictionary = ["opinion": "I agree"]
        let payload_stronglyAgree: MyDictionary = ["opinion": "I strongly agree"]
        
		let instance = RFOptionPickerFormItem()
		instance.title("Stop Global Warming?").placeholder("required")
        instance.append("Strongly disagree", identifier: "strongly_disagree", payload: payload_stronglyDisagree)
        instance.append("Disagree", identifier: "disagree", payload: payload_disagree)
        instance.append("Neutral", identifier: "neutral", payload: payload_neutral)
        instance.append("Agree", identifier: "agree", payload: payload_agree)
        instance.append("Strongly agree", identifier: "strongly_agree", payload: payload_stronglyAgree)
		instance.selectOptionWithIdentifier("neutral")
		instance.valueDidChange = { (selected: RFOptionRowModel?) in
			print("stop global warming: \(String(describing: selected))")
		}
		return instance
		}()

    lazy var cureDiseases: RFOptionPickerFormItem = {
        // Payloads is copy by value
        let payload_stronglyDisagree: Int = -2
        let payload_disagree: Int = -1
        let payload_neutral: Int = 0
        let payload_agree: Int = 1
        let payload_stronglyAgree: Int = 2
        
        let instance = RFOptionPickerFormItem()
        instance.title("Cure Diseases?").placeholder("required")
        instance.append("Strongly disagree", identifier: "strongly_disagree", payload: payload_stronglyDisagree)
        instance.append("Disagree", identifier: "disagree", payload: payload_disagree)
        instance.append("Neutral", identifier: "neutral", payload: payload_neutral)
        instance.append("Agree", identifier: "agree", payload: payload_agree)
        instance.append("Strongly agree", identifier: "strongly_agree", payload: payload_stronglyAgree)
        instance.selectOptionWithIdentifier("neutral")
        instance.valueDidChange = { (selected: RFOptionRowModel?) in
            print("cure diseases: \(String(describing: selected))")
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
        assignRandomOption(cureDiseases)
	}
}
