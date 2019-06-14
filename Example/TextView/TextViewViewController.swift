// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class TextViewViewController: RFFormViewController {

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "TextViews"
		builder += longSummary
		builder += notes
		builder += commentArea
		builder += userDescription
		builder += RFSectionHeaderTitleFormItem().title("Buttons")
		builder += randomizeButton
		builder += clearButton
	}

	lazy var longSummary: RFTextViewFormItem = {
		let instance = RFTextViewFormItem()
		instance.title("Long summary").placeholder("placeholder")
		instance.value = "Lorem ipsum"
		return instance
		}()

	lazy var notes: RFTextViewFormItem = {
		let instance = RFTextViewFormItem()
		instance.title("Notes").placeholder("I'm a placeholder")
		return instance
		}()

	lazy var commentArea: RFTextViewFormItem = {
		let instance = RFTextViewFormItem()
		instance.title("Comments").placeholder("I'm also a placeholder")
		return instance
		}()

	lazy var userDescription: RFTextViewFormItem = {
		let instance = RFTextViewFormItem()
		instance.title("Description").placeholder("Yet another placeholder")
		return instance
		}()

	lazy var randomizeButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Randomize"
		instance.action = { [weak self] in
			self?.randomize()
		}
		return instance
		}()

	lazy var clearButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Clear"
		instance.action = { [weak self] in
			self?.clear()
		}
		return instance
		}()

	func appendRandom(_ textView: RFTextViewFormItem, strings: [String]) {
		let notEmpty = textView.value.utf8.count != 0
		var s = ""
		if notEmpty {
			s = " "
		}
		textView.value += s + randomString(strings)
	}

	func randomize() {
		appendRandom(longSummary, strings: ["Hello", "World", "Cat", "Water", "Fish", "Hund"])
		appendRandom(notes, strings: ["Hat", "Ham", "Has"])
		commentArea.value += randomString(["a", "b", "c"])
		userDescription.value += randomString(["x", "y", "z", "w"])
	}

	func clear() {
		longSummary.value = ""
		notes.value = ""
		commentArea.value = ""
		userDescription.value = ""
	}
}
