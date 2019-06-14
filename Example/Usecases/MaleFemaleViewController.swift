// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

struct OptionRow {
	let title: String
	let identifier: String

	init(_ title: String, _ identifier: String) {
		self.title = title
		self.identifier = identifier
	}
}

class MyOptionForm {
	let optionRows: [OptionRow]
	let vc0 = RFViewControllerFormItem()

	init(optionRows: [OptionRow]) {
		self.optionRows = optionRows
	}

	func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Picker"

		configureVC0()

		for optionRow: OptionRow in optionRows {
			let option = RFOptionRowFormItem()
			option.title = optionRow.title
			builder.append(option)
		}

		builder.append(RFSectionHeaderTitleFormItem().title("Help"))
		builder.append(vc0)
	}

	func configureVC0() {
		vc0.title = "What is XYZ?"
		vc0.createViewController = { (dismissCommand: RFCommandProtocol) in
			let vc = EmptyViewController()
			return vc
		}
	}

}

class MaleFemaleViewController: RFFormViewController, RFSelectOptionDelegate {
	var xmyform: MyOptionForm?

	let dismissCommand: RFCommandProtocol

	init(dismissCommand: RFCommandProtocol) {
		self.dismissCommand = dismissCommand
		super.init()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	override func populate(_ builder: RFFormBuilder) {
		let optionRows: [OptionRow] = [
			OptionRow("Male", "male"),
			OptionRow("Female", "female"),
			OptionRow("It's complicated", "complicated")
		]

		let myform = MyOptionForm(optionRows: optionRows)

		myform.populate(builder)
		xmyform = myform
	}

	func form_willSelectOption(option: RFOptionRowFormItem) {
		print("select option \(option)")
		dismissCommand.execute(viewController: self, returnObject: option)
	}

}

class EmptyViewController: UIViewController {

	override func loadView() {
		self.view = UIView()
		self.view.backgroundColor = UIColor.red
	}

}
