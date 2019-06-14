// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class ColorPickerViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Color picker"
		builder.toolbarMode = .none

		builder.demo_showInfo("Tap row to expand/collapse.\nPinch to change precision.\nPan to change value.")

		builder += RFSectionHeaderTitleFormItem().title("Components")
		builder += slider0
		builder += slider1
		builder += slider2

		builder += RFSectionHeaderTitleFormItem().title("Summary")
		builder += summary
		builder += RFSectionFormItem()
		builder += randomizeButton

		updateSummary()
		updateColor()
	}

	lazy var slider0: RFPrecisionSliderFormItem = {
		let instance = RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(1000).value(500)
		instance.title = "Red"
		instance.sliderDidChangeBlock = { [weak self] _ in
			self?.updateSummary()
			self?.updateColor()
		}
		return instance
	}()

	lazy var slider1: RFPrecisionSliderFormItem = {
		let instance = RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(1000).value(500)
		instance.title = "Green"
		instance.sliderDidChangeBlock = { [weak self] _ in
			self?.updateSummary()
			self?.updateColor()
		}
		return instance
	}()

	lazy var slider2: RFPrecisionSliderFormItem = {
		let instance = RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(1000).value(500)
		instance.title = "Blue"
		instance.sliderDidChangeBlock = { [weak self] _ in
			self?.updateSummary()
			self?.updateColor()
		}
		return instance
	}()

	lazy var summary: RFStaticTextFormItem = {
		return RFStaticTextFormItem().title("Values").value("-")
	}()

	func updateSummary() {
		let s0 = String(format: "%.3f", slider0.actualValue)
		let s1 = String(format: "%.3f", slider1.actualValue)
		let s2 = String(format: "%.3f", slider2.actualValue)
		summary.value = "\(s0) , \(s1) , \(s2)"
	}

	func updateColor() {
		let color = UIColor(
			red: CGFloat(slider0.actualValue),
			green: CGFloat(slider1.actualValue),
			blue: CGFloat(slider2.actualValue),
			alpha: 1.0
		)
		view?.backgroundColor = color

		navigationController?.navigationBar.barTintColor = color
		navigationController?.navigationBar.isTranslucent = false
	}

	lazy var randomizeButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Randomize"
		instance.action = { [weak self] in
			self?.randomize()
		}
		return instance
	}()

	func assignRandomValue(_ formItem: RFPrecisionSliderFormItem) {
		formItem.value = randomInt(0, 1000)
	}

	func randomize() {
		assignRandomValue(slider0)
		assignRandomValue(slider1)
		assignRandomValue(slider2)
		updateSummary()
		updateColor()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

		// restore the navigationbar theme when leaving this page
		navigationController?.navigationBar.barTintColor = nil
		navigationController?.navigationBar.isTranslucent = true
	}
}
