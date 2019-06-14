// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class SegmentedControlsViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Segmented Controls"
		builder += RFSectionHeaderTitleFormItem(title: "Please select")
		builder += animal
		builder += spicy
		builder += drink
		builder += popcorn
		builder += RFSectionHeaderTitleFormItem(title: "World-wide delivery")
		builder += submitButton
		builder += RFSectionFooterTitleFormItem(title: "The animal may die during transport!")
		builder += RFSectionFormItem()
		builder += randomizeButton
	}

	lazy var animal: RFSegmentedControlFormItem = {
		let instance = RFSegmentedControlFormItem()
		instance.title = "Animal"
		instance.items = ["Cat", "Dog", "Fish"]
		return instance
	}()

	lazy var spicy: RFSegmentedControlFormItem = {
		let instance = RFSegmentedControlFormItem()
		instance.title = "Spicy"
		instance.items = ["Hot", "Yes", "No"]
		return instance
	}()

	lazy var drink: RFSegmentedControlFormItem = {
		let instance = RFSegmentedControlFormItem()
		instance.title = "Drink"
		instance.items = ["Beer", "Wine"]
		return instance
	}()

	lazy var popcorn: RFSegmentedControlFormItem = {
		let instance = RFSegmentedControlFormItem()
		instance.title = "Popcorn"
		instance.items = ["S", "M", "XL", "XXL"]
		instance.selected = 3
		return instance
	}()

	lazy var submitButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Place order"
		instance.action = { [weak self] in
			if let actualSelf = self {
				actualSelf.rf_simpleAlert("My Receipt", actualSelf.receipt)
			}
		}
		return instance
	}()

	var receipt: String {
		var s = "Animal: \(animal.selectedItem!), $180\n"
		s += "Spicy: \(spicy.selectedItem!), $1\n"
		s += "Drink: \(drink.selectedItem!), $30\n"
		s += "Popcorn: \(popcorn.selectedItem!), $100\n"
		s += "---\nTotal: $311 USD"
		return s
	}

	lazy var randomizeButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Randomize"
		instance.action = { [weak self] in
			self?.randomize()
		}
		return instance
	}()

	func assignRandomValue(_ formItem: RFSegmentedControlFormItem) {
		let count = formItem.items.count
		if count > 0 {
			formItem.selected = randomInt(0, count - 1)
		}
	}

	func randomize() {
		assignRandomValue(animal)
		assignRandomValue(spicy)
		assignRandomValue(drink)
		assignRandomValue(popcorn)
	}
}
