// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class SteppersViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Steppers"
		builder += RFSectionHeaderTitleFormItem().title("Animals seen")
		builder += catStepper
		builder += dogStepper
		builder += submitButton
	}

	lazy var catStepper: StepperFormItem = {
		let instance = StepperFormItem()
		instance.title = "Number of Cats"
		return instance
		}()

	lazy var dogStepper: StepperFormItem = {
		let instance = StepperFormItem()
		instance.title = "Number of Dogs"
		return instance
		}()

	lazy var submitButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Submit"
		instance.action = { [weak self] in
			let catCount = self?.catStepper.value ?? 0
			let dogCount = self?.dogStepper.value ?? 0
			self?.form_simpleAlert("Submit", "There are \(catCount) cats and \(dogCount) dogs!")
		}
		return instance
		}()
}
