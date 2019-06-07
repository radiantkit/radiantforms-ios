// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public protocol RFSelectOptionDelegate {
	func form_willSelectOption(option: RFOptionRowFormItem)
}


@available(*, unavailable, renamed: "RFSelectOptionDelegate")
typealias SelectOptionDelegate = RFSelectOptionDelegate
