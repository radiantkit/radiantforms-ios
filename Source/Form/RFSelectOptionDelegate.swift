// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public protocol RFSelectOptionDelegate {
	func form_willSelectOption(option: OptionRowFormItem)
}


@available(*, unavailable, renamed: "RFSelectOptionDelegate")
typealias SelectOptionDelegate = RFSelectOptionDelegate
