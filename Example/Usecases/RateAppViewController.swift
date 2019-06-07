// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class RateAppViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Rate"
		builder.toolbarMode = .none
		builder.demo_showInfo("Rate this app")
		builder += RFSectionHeaderTitleFormItem().title("Is it good?")
		builder += goodSlider
		builder += RFSectionHeaderTitleFormItem().title("Is the look ok?")
		builder += lookSlider
		builder += RFSectionHeaderTitleFormItem().title("Thank you")
		builder += submitButton
	}

	lazy var goodSlider: RFSliderFormItem = {
		let instance = RFSliderFormItem()
		instance.minimumValue(-100.0).maximumValue(100.0).value(0)
		return instance
		}()

	lazy var lookSlider: RFSliderFormItem = {
		let instance = RFSliderFormItem()
		instance.minimumValue(-100.0).maximumValue(100.0).value(0)
		return instance
		}()

	lazy var submitButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Submit My Rating"
		instance.action = { [weak self] in
			self?.submitMyRating()
		}
		return instance
		}()

	func submitMyRating() {
		self.rf_simpleAlert("Submit Rating", "Button clicked")
	}
}
