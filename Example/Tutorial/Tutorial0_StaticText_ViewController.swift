// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import SwiftyFORM

class Tutorial0_StaticText_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += StaticTextFormItem().title("Hello").value("World")
	}
}
