// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class StaticTextAndAttributedTextViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Text"
		builder.toolbarMode = .none

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
