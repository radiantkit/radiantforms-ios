// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class SlidersViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Sliders"
		builder.toolbarMode = .none

		builder += RFSectionHeaderTitleFormItem().title("Sliders")
		builder += slider0
		builder += slider1
		builder += slider2

		builder += RFSectionHeaderTitleFormItem().title("Summary")
		builder += summary

		updateSummary()
	}

	lazy var slider0: RFSliderFormItem = {
		let instance = RFSliderFormItem().minimumValue(-1.0).maximumValue(1.0).value(-0.5)
		instance.sliderDidChangeBlock = { [weak self] (value: Float) in
			self?.updateSummary()
		}
		return instance
	}()

	lazy var slider1: RFSliderFormItem = {
		let instance = RFSliderFormItem().minimumValue(-100.0).maximumValue(100.0).value(42)
		instance.sliderDidChangeBlock = { [weak self] (value: Float) in
			self?.updateSummary()
		}
		return instance
	}()

	lazy var slider2: RFSliderFormItem = {
		let instance = RFSliderFormItem().minimumValue(0.0).maximumValue(100.0).value(80)
		instance.sliderDidChangeBlock = { [weak self] (value: Float) in
			self?.updateSummary()
		}
		return instance
	}()

	lazy var summary: RFStaticTextFormItem = {
		return RFStaticTextFormItem().title("Values").value("-")
	}()

	func updateSummary() {
		let s0 = String(format: "%.1f", slider0.value)
		let s1 = String(format: "%.1f", slider1.value)
		let s2 = String(format: "%.1f", slider2.value)
		summary.value = "\(s0) , \(s1) , \(s2)"
	}
}
