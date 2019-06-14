// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class DatePickerRangeViewController: RFFormViewController {
	lazy var datePicker_time_min: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		// -(5 * 60 * 60 + 5 * 60 + 5) == -18305
		instance.minimumDate = Date(timeIntervalSinceNow: -18305)
		return instance
		}()

	lazy var datePicker_date_min: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		// -5 * 24 * 60 * 60 == -432000
		instance.minimumDate = Date(timeIntervalSinceNow: -432000)
		return instance
		}()

	lazy var datePicker_dateAndTime_min: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		// -5 * 24 * 60 * 60 == -432000
		instance.minimumDate = Date(timeIntervalSinceNow: -432000)
		return instance
		}()

	lazy var datePicker_time_max: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		// 5 * 60 * 60 + 5 * 60 + 5 == 18305
		instance.maximumDate = Date(timeIntervalSinceNow: 18305)
		return instance
		}()

	lazy var datePicker_date_max: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		// 5 * 24 * 60 * 60 == 432000
		instance.maximumDate = Date(timeIntervalSinceNow: 432000)
		return instance
		}()

	lazy var datePicker_dateAndTime_max: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		// 5 * 24 * 60 * 60 == 432000
		instance.maximumDate = Date(timeIntervalSinceNow: 432000)
		return instance
		}()

	lazy var datePicker_time_minmax: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		// 5 * 60 * 60 + 5 * 60 + 5 == 18305
		instance.minimumDate = Date(timeIntervalSinceNow: -18305)
		instance.maximumDate = Date(timeIntervalSinceNow: 18305)
		return instance
		}()

	lazy var datePicker_date_minmax: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		// 5 * 24 * 60 * 60 == 432000
		instance.minimumDate = Date(timeIntervalSinceNow: -432000)
		instance.maximumDate = Date(timeIntervalSinceNow: 432000)
		return instance
		}()

	lazy var datePicker_dateAndTime_minmax: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		// 5 * 24 * 60 * 60 == 432000
		instance.minimumDate = Date(timeIntervalSinceNow: -432000)
		instance.maximumDate = Date(timeIntervalSinceNow: 432000)
		return instance
		}()

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "DatePicker & Range"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Demonstration of\nUIDatePicker with range")
		builder += RFSectionHeaderTitleFormItem().title("Minimum limit")
		builder += datePicker_time_min
		builder += datePicker_date_min
		builder += datePicker_dateAndTime_min
		builder += RFSectionHeaderTitleFormItem().title("Maximum limit")
		builder += datePicker_time_max
		builder += datePicker_date_max
		builder += datePicker_dateAndTime_max
		builder += RFSectionHeaderTitleFormItem().title("Minimum and maximum limits")
		builder += datePicker_time_minmax
		builder += datePicker_date_minmax
		builder += datePicker_dateAndTime_minmax
	}

}
