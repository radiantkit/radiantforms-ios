// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import RadiantForms

class Tutorial0_StaticText_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += RFStaticTextFormItem().title("Hello").value("World")
	}
}
