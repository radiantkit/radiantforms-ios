// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import Foundation

/**
# Inline picker view

### Tap to expand/collapse

Behind the scenes this creates a `UIPickerView`.
*/
public class PickerViewFormItem: FormItem {
	override func accept(visitor: FormItemVisitor) {
		visitor.visit(self)
	}
	
	public var title: String = ""
	public func title(title: String) -> Self {
		self.title = title
		return self
	}
	
	/**
	### Collapsed
	
	When the `behavior` is set to `Collapsed` then
	the picker view starts out being hidden.
	
	The user has to tap the row to expand it.
	This will collapse other inline picker views.
	

	### Expanded
	
	When the `behavior` is set to `Expanded` then
	the picker view starts out being visible.
	
	The user has to tap the row to collapse it.
	Or if another control becomes first respond this will collapse it.
	When the keyboard appears this will collapse it.
	
	
	### ExpandedAlways
	
	When the `behavior` is set to `ExpandedAlways` then
	the picker view is always expanded. It cannot be collapsed.
	It is not affected by `becomeFirstResponder()` nor `resignFirstResponder()`.
	*/
	public enum Behavior {
		case Collapsed
		case Expanded
		case ExpandedAlways
	}
	public var behavior = Behavior.Collapsed
	public func behavior(behavior: Behavior) -> Self {
		self.behavior = behavior
		return self
	}
	
	// TODO: picker view value
}
