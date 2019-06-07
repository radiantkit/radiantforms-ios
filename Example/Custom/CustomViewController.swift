// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class CustomViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Custom cells"
		builder.toolbarMode = .simple
		builder.demo_showInfo("Demonstration of\ncustom cells using\nCustomFormItem")

		builder += RFSectionHeaderTitleFormItem(title: "World news")
		let loaderItem0 = RFCustomFormItem()
		loaderItem0.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem0

		builder += RFSectionHeaderTitleFormItem().title("Technology news")
		let loaderItem1 = RFCustomFormItem()
		loaderItem1.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem1

		builder += RFSectionHeaderTitleFormItem().title("Game news")
		let loaderItem2 = RFCustomFormItem()
		loaderItem2.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem2

		builder += RFSectionHeaderTitleFormItem().title("Fashion news")
		let loaderItem3 = RFCustomFormItem()
		loaderItem3.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem3

		builder += RFSectionHeaderTitleFormItem().title("Biz news")
		let loaderItem4 = RFCustomFormItem()
		loaderItem4.createCell = { _ in
			return try LoadingCell.createCell()
		}
		builder += loaderItem4
	}

}
