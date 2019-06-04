// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import SwiftyFORM

class Tutorial1_TextField_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += TextFieldFormItem().title("Email").placeholder("Please specify").keyboardType(.emailAddress)
	}
}
