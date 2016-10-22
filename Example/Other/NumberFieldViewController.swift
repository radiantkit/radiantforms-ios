// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import SwiftyFORM

class NumberFieldViewController: FormViewController {
	override func populate(_ builder: FormBuilder) {
		builder.navigationTitle = "NumberField"
		builder.toolbarMode = .simple
		builder += numberField0
		builder += numberField1
		builder += numberField2
		builder += numberField3
	}
	
	lazy var numberField0: NumberFieldFormItem = {
		let instance = NumberFieldFormItem()
		instance.title = "Field 0"
		instance.value = "1234"
		return instance
	}()
	
	lazy var numberField1: NumberFieldFormItem = {
		let instance = NumberFieldFormItem()
		instance.title = "Field 1"
		instance.value = "1234.5"
		return instance
	}()
	
	lazy var numberField2: NumberFieldFormItem = {
		let instance = NumberFieldFormItem()
		instance.title = "Field 2"
		instance.value = "1234.56"
		return instance
	}()
	
	lazy var numberField3: NumberFieldFormItem = {
		let instance = NumberFieldFormItem()
		instance.title = "Field 3"
		instance.value = "1234.567"
		return instance
	}()
}
