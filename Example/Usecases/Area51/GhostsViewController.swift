// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class GhostsViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Ghosts"
		builder.toolbarMode = .none
		builder += RFSectionHeaderTitleFormItem().title("Scary")
		builder += scarySlider
		builder += RFSectionHeaderTitleFormItem().title("See through")
		builder += transparantSlider
		builder += RFSectionHeaderTitleFormItem().title("Human looking")
		builder += humanLookingSlider
		builder += RFSectionHeaderTitleFormItem().title("Making noises")
		builder += makingNoisesSlider
		builder += RFSectionHeaderTitleFormItem()
		builder += submitButton
	}

	lazy var scarySlider: RFSliderFormItem = {
		let instance = RFSliderFormItem()
		instance.minimumValue(0.0).maximumValue(100.0).value(50.0)
		return instance
		}()

	lazy var transparantSlider: RFSliderFormItem = {
		let instance = RFSliderFormItem()
		instance.minimumValue(0.0).maximumValue(100.0).value(50.0)
		return instance
		}()

	lazy var humanLookingSlider: RFSliderFormItem = {
		let instance = RFSliderFormItem()
		instance.minimumValue(0.0).maximumValue(100.0).value(50.0)
		return instance
		}()

	lazy var makingNoisesSlider: RFSliderFormItem = {
		let instance = RFSliderFormItem()
		instance.minimumValue(0.0).maximumValue(100.0).value(50.0)
		return instance
		}()

	lazy var submitButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Submit"
		instance.action = { [weak self] in
			self?.submit()
		}
		return instance
		}()

	func submit() {
		var s = "scary: \(scarySlider.value)\n"
		s += "transparant: \(transparantSlider.value)\n"
		s += "human looking: \(humanLookingSlider.value)\n"
		s += "noisy: \(makingNoisesSlider.value)"
		rf_simpleAlert("Ghost encounters", s)
	}
}
