// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class TextViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Text"
		builder.toolbarMode = .none

        builder += RFSectionHeaderTitleFormItem(title: "Text")
        builder += RFTextFormItem().text("Multiline 0. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        builder += RFTextFormItem().text("Multiline 1. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        builder += RFTextFormItem().text("Multiline 2. Row A\nRow B\nRow C\nRow D")

		builder += RFSectionHeaderTitleFormItem(title: "Static Text")
		builder += RFStaticTextFormItem().title("Title 0").value("Value 0")
		builder += RFStaticTextFormItem().title("Title 1").value("Value 1")
		builder += RFStaticTextFormItem().title("Title 2").value("Value 2")

		builder += RFSectionHeaderTitleFormItem(title: "Attributed Text")
		builder += RFAttributedTextFormItem().title("Title 0").value("Value 0")
		builder += RFAttributedTextFormItem()
			.title("Title 1", [NSAttributedString.Key.foregroundColor.rawValue: UIColor.gray as AnyObject])
			.value("Value 1", [
				NSAttributedString.Key.backgroundColor.rawValue: UIColor.black as AnyObject,
				NSAttributedString.Key.foregroundColor.rawValue: UIColor.white as AnyObject
				])
		builder += RFAttributedTextFormItem()
			.title("Orange 🍊", [
				NSAttributedString.Key.foregroundColor.rawValue: UIColor.orange as AnyObject,
				NSAttributedString.Key.font.rawValue: UIFont.boldSystemFont(ofSize: 24) as AnyObject,
				NSAttributedString.Key.underlineStyle.rawValue: NSUnderlineStyle.form_single.rawValue as AnyObject
				])
			.value("Heart ❤️", [NSAttributedString.Key.foregroundColor.rawValue: UIColor.red as AnyObject])
        builder += RFAttributedTextFormItem()
            .title("Banana 🍌\nNot visible line", [
                NSAttributedString.Key.foregroundColor.rawValue: UIColor.yellow as AnyObject,
                NSAttributedString.Key.font.rawValue: UIFont.boldSystemFont(ofSize: 24) as AnyObject,
                NSAttributedString.Key.underlineStyle.rawValue: NSUnderlineStyle.form_single.rawValue as AnyObject
                ])
            .value("Apple 🍏\nNot visible line", [NSAttributedString.Key.foregroundColor.rawValue: UIColor.green as AnyObject])
	}
}

fileprivate extension NSUnderlineStyle {
    static var form_single: NSUnderlineStyle {
        #if swift(>=4.2)
            // 'single' was introduced in Swift 4.2
            return NSUnderlineStyle.single
        #else
            // Swift 4.0 and earlier
            return NSUnderlineStyle.styleSingle
        #endif
    }
}
