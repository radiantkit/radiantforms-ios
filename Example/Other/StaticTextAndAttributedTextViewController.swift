// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class StaticTextAndAttributedTextViewController: FormViewController {
	override func populate(_ builder: FormBuilder) {
		builder.navigationTitle = "Text"
		builder.toolbarMode = .none

		builder += SectionHeaderTitleFormItem(title: "Static Text")
		builder += StaticTextFormItem().title("Title 0").value("Value 0")
		builder += StaticTextFormItem().title("Title 1").value("Value 1")
		builder += StaticTextFormItem().title("Title 2").value("Value 2")

		builder += SectionHeaderTitleFormItem(title: "Attributed Text")
		builder += AttributedTextFormItem().title("Title 0").value("Value 0")
		builder += AttributedTextFormItem()
			.title("Title 1", [NSAttributedString.Key.foregroundColor.rawValue: UIColor.gray as AnyObject])
			.value("Value 1", [
				NSAttributedString.Key.backgroundColor.rawValue: UIColor.black as AnyObject,
				NSAttributedString.Key.foregroundColor.rawValue: UIColor.white as AnyObject
				])
		builder += AttributedTextFormItem()
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
