// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import SwiftyFORM

class Tutorial1_TextField_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += RFTextFieldFormItem().title("Email").placeholder("Please specify").keyboardType(.emailAddress)
	}
}
