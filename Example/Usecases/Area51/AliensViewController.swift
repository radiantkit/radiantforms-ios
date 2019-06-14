// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class AliensViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Aliens"
		builder.toolbarMode = .none
		builder += stepperForm0
		builder += button0
	}

	lazy var stepperForm0: RFStepperFormItem = {
		let instance = RFStepperFormItem()
		instance.title = "Alien encounters"
		return instance
		}()

	lazy var button0: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Submit"
		instance.action = { [weak self] in
			if let stepperValue = self?.stepperForm0.value {
				self?.rf_simpleAlert("Aliens encounters", "I have encountered \(stepperValue) aliens!")
			}
		}
		return instance
		}()

}
