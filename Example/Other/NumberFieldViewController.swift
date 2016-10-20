// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import SwiftyFORM

class NumberFieldViewController: FormViewController {
	override func populate(_ builder: FormBuilder) {
		builder.navigationTitle = "NumberField"
		builder.toolbarMode = .none
		builder += numberField
	}
	
	lazy var numberField: NumberFieldFormItem = {
		let instance = NumberFieldFormItem()
		instance.title = "Title"
		instance.value = "123.456"
		return instance
	}()
}
