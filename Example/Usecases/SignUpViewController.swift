// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class SignUpViewController: RFFormViewController {
	override func loadView() {
		super.loadView()
		form_installSubmitButton()
	}

	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Sign Up"
		builder.toolbarMode = .simple
		builder.demo_showInfo("SocialNetwork 123\nSign up form")
		builder += RFSectionHeaderTitleFormItem().title("Details")
		builder += userName
		builder += password
		builder += email
		builder += maleOrFemale
		builder += birthday
		builder.alignLeft([userName, password, email])
        builder += shoeSize
		builder += RFSectionFormItem()
		builder += subscribeToNewsletter
		builder += RFSectionFooterTitleFormItem().title("There is no way to unsubscribe our service")
		builder += metaData
		builder += RFSectionHeaderTitleFormItem().title("Buttons")
		builder += randomizeButton
		builder += jsonButton
	}

	lazy var userName: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("User Name").placeholder("required")
		instance.keyboardType = .asciiCapable
		instance.autocorrectionType = .no
		instance.validate(RFCharacterSetSpecification.lowercaseLetters, message: "Must be lowercase letters")
		instance.submitValidate(RFCountSpecification.min(6), message: "Length must be minimum 6 letters")
		instance.validate(RFCountSpecification.max(8), message: "Length must be maximum 8 letters")
		return instance
		}()

	lazy var maleOrFemale: RFViewControllerFormItem = {
		let instance = RFViewControllerFormItem()
		instance.title("Male or Female").placeholder("required")
		instance.createViewController = { (dismissCommand: RFCommandProtocol) in
			let vc = MaleFemaleViewController(dismissCommand: dismissCommand)
			return vc
		}
		instance.willPopViewController = { (context: RFViewControllerFormItemPopContext) in
			if let x = context.returnedObject as? RFOptionRowFormItem {
				context.cell.detailTextLabel?.text = x.title
			} else {
				context.cell.detailTextLabel?.text = nil
			}
		}
		return instance
		}()

	lazy var password: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("PIN Code").password().placeholder("required")
		instance.keyboardType = .numberPad
		instance.autocorrectionType = .no
		instance.validate(RFCharacterSetSpecification.decimalDigits, message: "Must be digits")
		instance.submitValidate(RFCountSpecification.min(4), message: "Length must be minimum 4 digits")
		instance.validate(RFCountSpecification.max(6), message: "Length must be maximum 6 digits")
		return instance
		}()

	lazy var email: RFTextFieldFormItem = {
		let instance = RFTextFieldFormItem()
		instance.title("Email").placeholder("johndoe@example.com")
		instance.keyboardType = .emailAddress
		instance.submitValidate(RFCountSpecification.min(6), message: "Length must be minimum 6 letters")
		instance.validate(RFCountSpecification.max(60), message: "Length must be maximum 60 letters")
		instance.softValidate(RFEmailSpecification(), message: "Must be a valid email address")
		return instance
		}()

	func offsetDate(_ date: Date, years: Int) -> Date {
		var dateComponents = DateComponents()
		dateComponents.year = years
		let calendar = Calendar.current
		guard let resultDate = calendar.date(byAdding: dateComponents, to: date) else {
			return date
		}
		return resultDate
	}

	lazy var birthday: RFDatePickerFormItem = {
		let today = Date()
		let instance = RFDatePickerFormItem()
		instance.title = "Birthday"
		instance.datePickerMode = .date
		instance.minimumDate = self.offsetDate(today, years: -150)
		instance.maximumDate = today
		return instance
		}()

    lazy var shoeSize: RFSegmentedControlFormItem = {
        let instance = RFSegmentedControlFormItem()
        instance.title = "Shoe Size"
        instance.items = ["S", "M", "L", "XL"]
        return instance
    }()
    
	lazy var subscribeToNewsletter: RFSwitchFormItem = {
		let instance = RFSwitchFormItem()
		instance.title = "Subscribe to newsletter"
		instance.value = true
		return instance
		}()

	lazy var metaData: RFMetaFormItem = {
		let instance = RFMetaFormItem()
		var dict = [String: AnyObject?]()
		dict["key0"] = "I'm hidden text" as AnyObject?
		dict["key1"] = "I'm included when exporting to JSON" as AnyObject?
		dict["key2"] = "Can be used to pass extra info along with the JSON" as AnyObject?
		instance.value(dict as AnyObject?).elementIdentifier("metaData")
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

	func randomDate() -> Date {
		let i = randomInt(20, 60)
		let today = Date()
		return offsetDate(today, years: -i)
	}

    func assignRandomValue(_ formItem: RFSegmentedControlFormItem) {
        let count = formItem.items.count
        if count > 0 {
            formItem.selected = randomInt(0, count - 1)
        }
    }
    
	func randomize() {
		userName.value = randomString(["john", "jane", "steve", "bill", "einstein", "newton"])
		password.value = randomString(["1234", "0000", "111111", "abc", "111122223333"])
		email.value = randomString(["hello@example.com", "hi@example.com", "feedback@example.com", "unsubscribe@example.com", "not-a-valid-email"])
		birthday.value = randomDate()
        assignRandomValue(shoeSize)
		subscribeToNewsletter.value = randomBool()
	}

	lazy var jsonButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "View JSON"
		instance.action = { [weak self] in
			if let vc = self {
				RFDebugViewController.showJSON(vc, jsonData: vc.formBuilder.dump())
			}
		}
		return instance
		}()

}

class SignUpViewController_Dark: SignUpViewController {}
class SignUpViewController_Light: SignUpViewController {}
