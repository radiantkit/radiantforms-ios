// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class TextFieldReturnKeyViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Return Key"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Shows all the UIReturnKeyType variants")
		builder += RFTextFieldFormItem().styleClass("align").title("Default").returnKeyType(.default).placeholder("Return (gray)")
		builder += RFTextFieldFormItem().styleClass("align").title("Go").returnKeyType(.go).placeholder("Go (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Google").returnKeyType(.google).placeholder("Search (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Join").returnKeyType(.join).placeholder("Join (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Next").returnKeyType(.next).placeholder("Next (gray)")
		builder += RFTextFieldFormItem().styleClass("align").title("Route").returnKeyType(.route).placeholder("Route (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Search").returnKeyType(.search).placeholder("Search (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Send").returnKeyType(.send).placeholder("Send (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Yahoo").returnKeyType(.yahoo).placeholder("Search (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Done").returnKeyType(.done).placeholder("Done (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("EmergencyCall").returnKeyType(.emergencyCall).placeholder("Emergency Call (blue)")
		builder += RFTextFieldFormItem().styleClass("align").title("Continue").returnKeyType(.continue).placeholder("Continue (gray)")
		builder.alignLeftElementsWithClass("align")
	}
}
