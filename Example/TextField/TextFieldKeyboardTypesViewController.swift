// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class TextFieldKeyboardTypesViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Keyboard Types"
		builder.toolbarMode = .none
		builder.demo_showInfo("Shows all the UIKeyboardType variants")
		builder += RFTextFieldFormItem().styleClass("align").title("ASCIICapable").placeholder("Lorem Ipsum").keyboardType(.asciiCapable)
		builder += RFTextFieldFormItem().title("NumbersAndPunctuation").placeholder("123.45").keyboardType(.numbersAndPunctuation)
		builder += RFTextFieldFormItem().styleClass("align").title("URL").placeholder("example.com/blog").keyboardType(.URL)
		builder += RFTextFieldFormItem().styleClass("align").title("NumberPad").placeholder("0123456789").keyboardType(.numberPad)
		builder += RFTextFieldFormItem().styleClass("align").title("PhonePad").placeholder("+999#22;123456,27").keyboardType(.phonePad)
		builder += RFTextFieldFormItem().styleClass("align").title("EmailAddress").placeholder("johnappleseed@apple.com").keyboardType(.emailAddress)
		builder += RFTextFieldFormItem().styleClass("align").title("DecimalPad").placeholder("1234.5678").keyboardType(.decimalPad)
		builder += RFTextFieldFormItem().styleClass("align").title("Twitter").placeholder("@user or #hashtag").keyboardType(.twitter)
		builder += RFTextFieldFormItem().styleClass("align").title("WebSearch").placeholder("how to do this.").keyboardType(.webSearch)
		builder.alignLeftElementsWithClass("align")
		builder += RFSectionFooterTitleFormItem().title("Footer text")
	}
}
