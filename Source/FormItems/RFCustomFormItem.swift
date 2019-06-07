// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public class RFCustomFormItem: FormItem {
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
