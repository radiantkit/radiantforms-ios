// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import Foundation

public class SectionFormItem: RFFormItem {
	override func accept(visitor: RFFormItemVisitor) {
		visitor.visit(object: self)
	}
}

public class SectionHeaderTitleFormItem: RFFormItem {
	public init(title: String? = nil) {
		self.title = title
		super.init()
	}

	override func accept(visitor: RFFormItemVisitor) {
		visitor.visit(object: self)
	}

	/// The section title is shown in uppercase.
	///
	/// Works best with texts shorter than 50 characters
	///
	/// Longer texts that spans multiple lines can cause crashes with expand/collapse animations.
	/// In this case consider using the `SectionHeaderViewFormItem` class.
	public var title: String?

	@discardableResult
	public func title(_ title: String) -> Self {
		self.title = title
		return self
	}
}

public class SectionHeaderViewFormItem: RFFormItem {
	override func accept(visitor: RFFormItemVisitor) {
		visitor.visit(object: self)
	}

	public typealias CreateUIView = () -> UIView?
	public var viewBlock: CreateUIView?
}

public class SectionFooterTitleFormItem: RFFormItem {
	public init(title: String? = nil) {
		self.title = title
		super.init()
	}

	override func accept(visitor: RFFormItemVisitor) {
		visitor.visit(object: self)
	}

	public var title: String?

	@discardableResult
	public func title(_ title: String) -> Self {
		self.title = title
		return self
	}
}

public class SectionFooterViewFormItem: RFFormItem {
	override func accept(visitor: RFFormItemVisitor) {
		visitor.visit(object: self)
	}

	public typealias CreateUIView = () -> UIView?
	public var viewBlock: CreateUIView?
}
