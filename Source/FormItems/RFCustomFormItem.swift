// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

public class RFCustomFormItem: RFFormItem {
	public struct Context {
		public let viewController: UIViewController
	}

	public enum CustomFormItemError: Error {
		case couldNotCreate
	}

	public typealias CreateCell = (Context) throws -> UITableViewCell
	public var createCell: CreateCell = { _ in throw CustomFormItemError.couldNotCreate }

	override func accept(visitor: RFFormItemVisitor) {
		visitor.visit(object: self)
	}
}

@available(*, unavailable, renamed: "RFCustomFormItem")
typealias CustomFormItem = RFCustomFormItem
