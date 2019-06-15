// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class DatePickerInitialValueViewController: RFFormViewController {
	lazy var datePicker_time_noValue: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		instance.minuteInterval = 15
		return instance
		}()

	lazy var datePicker_date_noValue: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		return instance
		}()

	lazy var datePicker_dateAndTime_noValue: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		return instance
		}()

	lazy var datePicker_time_value: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		// 5 * 60 * 60 + 5 * 60 + 5 == 18305
		instance.value = Date(timeIntervalSinceNow: 18305)
		return instance
		}()

	lazy var datePicker_date_value: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		// 51 * 24 * 60 * 60 == 4406400
		instance.value = Date(timeIntervalSinceNow: 4406400)
		return instance
		}()

	lazy var datePicker_dateAndTime_value: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		// 51 * 24 * 60 * 60 == 4406400
		instance.value = Date(timeIntervalSinceNow: 4406400)
		return instance
		}()

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "DatePicker & Value"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Demonstration of\nUIDatePicker with initial value")
		builder += RFSectionHeaderTitleFormItem().title("Without initial date")
		builder += datePicker_time_noValue
		builder += datePicker_date_noValue
		builder += datePicker_dateAndTime_noValue
		builder += RFSectionHeaderTitleFormItem().title("With initial date")
		builder += datePicker_time_value
		builder += datePicker_date_value
		builder += datePicker_dateAndTime_value
	}

}
