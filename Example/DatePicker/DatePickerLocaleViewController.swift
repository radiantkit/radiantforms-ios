// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class DatePickerLocaleViewController: RFFormViewController {

	lazy var datePicker_time_currentLocale: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		return instance
		}()

	lazy var datePicker_date_currentLocale: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		return instance
	}()

	lazy var datePicker_dateAndTime_currentLocale: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		return instance
		}()

	lazy var datePicker_time_da_DK: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		instance.locale = Locale(identifier: "da_DK")
		return instance
		}()

	lazy var datePicker_date_da_DK: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		instance.locale = Locale(identifier: "da_DK")
		return instance
		}()

	lazy var datePicker_dateAndTime_da_DK: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		instance.locale = Locale(identifier: "da_DK")
		return instance
		}()

	lazy var datePicker_time_zh_CN: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Time"
		instance.datePickerMode = .time
		instance.locale = Locale(identifier: "zh_CN")
		return instance
		}()

	lazy var datePicker_date_zh_CN: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "Date"
		instance.datePickerMode = .date
		instance.locale = Locale(identifier: "zh_CN")
		return instance
		}()

	lazy var datePicker_dateAndTime_zh_CN: RFDatePickerFormItem = {
		let instance = RFDatePickerFormItem()
		instance.title = "DateAndTime"
		instance.datePickerMode = .dateAndTime
		instance.locale = Locale(identifier: "zh_CN")
		return instance
		}()

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "DatePicker & Locale"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Demonstration of\nUIDatePicker with locale")
		builder += RFSectionHeaderTitleFormItem(title: "Current locale")
		builder += datePicker_time_currentLocale
		builder += datePicker_date_currentLocale
		builder += datePicker_dateAndTime_currentLocale
		builder += RFSectionHeaderTitleFormItem(title: "da_DK")
		builder += datePicker_time_da_DK
		builder += datePicker_date_da_DK
		builder += datePicker_dateAndTime_da_DK
		builder += RFSectionHeaderTitleFormItem(title: "zh_CN")
		builder += datePicker_time_zh_CN
		builder += datePicker_date_zh_CN
		builder += datePicker_dateAndTime_zh_CN
	}
}
