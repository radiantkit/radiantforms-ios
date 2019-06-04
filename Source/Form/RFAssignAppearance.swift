// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public protocol RFAssignAppearance {
	func assignDefaultColors()
	func assignTintColors()
}

@available(*, unavailable, renamed: "RFAssignAppearance")
typealias AssignAppearance = RFAssignAppearance
