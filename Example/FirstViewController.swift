// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class FirstViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "RadiantForms"
		builder.demo_showInfo("Welcome to the\nform example app\nthat shows everything")

        builder += RFSectionHeaderTitleFormItem().title("Theme")
        builder += RFViewControllerFormItem().title("Amount (Dark Default)").viewController(AmountViewController_DarkDefault.self)
		builder += RFViewControllerFormItem().title("Amount (Dark Fun)").viewController(AmountViewController_DarkFun.self)
        builder += RFViewControllerFormItem().title("Amount (Light Default)").viewController(AmountViewController_LightDefault.self)
		builder += RFViewControllerFormItem().title("Amount (Light Fun)").viewController(AmountViewController_LightFun.self)
        builder += RFViewControllerFormItem().title("Sign Up (Dark Default)").viewController(SignUpViewController_DarkDefault.self)
		builder += RFViewControllerFormItem().title("Sign Up (Dark Fun)").viewController(SignUpViewController_DarkFun.self)
		builder += RFViewControllerFormItem().title("Sign Up (Light Default)").viewController(SignUpViewController_LightDefault.self)
        builder += RFViewControllerFormItem().title("Sign Up (Light Fun)").viewController(SignUpViewController_LightFun.self)

        builder += RFSectionHeaderTitleFormItem().title("Tutorial")
		builder += RFViewControllerFormItem().title("StaticText").viewController(Tutorial0_StaticText_ViewController.self)
		builder += RFViewControllerFormItem().title("TextField").viewController(Tutorial1_TextField_ViewController.self)
		builder += RFViewControllerFormItem().title("Child ViewController").viewController(Tutorial2_ChildViewController_ViewController.self)

		builder += RFSectionHeaderTitleFormItem().title("Usecases")
		builder += RFViewControllerFormItem().title("Sign Up (Dark)").viewController(SignUpViewController_DarkDefault.self)
        builder += RFViewControllerFormItem().title("Sign Up (Light)").viewController(SignUpViewController_LightDefault.self)
		builder += RFViewControllerFormItem().title("Color Picker").viewController(ColorPickerViewController.self)
		builder += RFViewControllerFormItem().title("Settings").storyboard("Settings", bundle: nil)
		builder += RFViewControllerFormItem().title("Change Password").viewController(ChangePasswordViewController.self)
		builder += RFViewControllerFormItem().title("Report").viewController(ReportViewController.self)
		builder += RFViewControllerFormItem().title("Rate").viewController(RateAppViewController.self)
		builder += RFViewControllerFormItem().title("Storyboard Demo").viewController(StoryboardDemoViewController.self)
		builder += RFViewControllerFormItem().title("Area 51").storyboard("Area51", bundle: nil)

		builder += RFSectionHeaderTitleFormItem().title("Non-RadiantForms")
		builder += RFViewControllerFormItem().title("UICollectionViewController").viewController(MyCollectionViewController.self)
		builder += RFViewControllerFormItem().title("UITableViewController").viewController(MyTableViewController.self)

		builder += RFSectionHeaderTitleFormItem().title("TextField")
		builder += RFViewControllerFormItem().title("Valid & Invalid").viewController(TextFieldValidInvalidViewController.self)
		builder += RFViewControllerFormItem().title("Keyboard Types").viewController(TextFieldKeyboardTypesViewController.self)
		builder += RFViewControllerFormItem().title("Tab Through Form").viewController(TextFieldTabThroughFormViewController.self)
        builder += RFViewControllerFormItem().title("Return Key").viewController(TextFieldReturnKeyViewController.self)
        builder += RFViewControllerFormItem().title("Editing End").viewController(TextFieldEditingEndViewController.self)
        builder += RFViewControllerFormItem().title("Amount (Dark)").viewController(AmountViewController_DarkDefault.self)
        builder += RFViewControllerFormItem().title("Amount (Light)").viewController(AmountViewController_LightDefault.self)

		builder += RFSectionHeaderTitleFormItem().title("TextView")
		builder += RFViewControllerFormItem().title("TextViews").viewController(TextViewViewController.self)

		builder += RFSectionHeaderTitleFormItem().title("DatePicker")
		builder += RFViewControllerFormItem().title("DatePicker With Locale").viewController(DatePickerLocaleViewController.self)
		builder += RFViewControllerFormItem().title("DatePicker With Range").viewController(DatePickerRangeViewController.self)
		builder += RFViewControllerFormItem().title("DatePicker With Initial Value").viewController(DatePickerInitialValueViewController.self)
		builder += RFViewControllerFormItem().title("DatePicker With Bindings").viewController(DatePickerBindingViewController.self)

		builder += RFSectionHeaderTitleFormItem().title("Header & Footer")
		builder += RFViewControllerFormItem().title("Header & Footer").viewController(HeaderFooterViewController.self)
		builder += RFViewControllerFormItem().title("No Header").viewController(NoHeaderViewController.self)

		builder += RFSectionHeaderTitleFormItem().title("Other")
		builder += RFViewControllerFormItem().title("Static & Attributed Text").viewController(StaticTextAndAttributedTextViewController.self)
		builder += RFViewControllerFormItem().title("Buttons").viewController(ButtonsViewController.self)
		builder += RFViewControllerFormItem().title("Sliders").viewController(SlidersViewController.self)
		builder += RFViewControllerFormItem().title("Segmented Controls").viewController(SegmentedControlsViewController.self)
		builder += RFViewControllerFormItem().title("Options").viewController(OptionsViewController.self)
		builder += RFViewControllerFormItem().title("Steppers").viewController(SteppersViewController.self)
		builder += RFViewControllerFormItem().title("Custom Cells").viewController(CustomViewController.self)
		builder += RFViewControllerFormItem().title("PickerView").viewController(PickerViewViewController.self)
		builder += RFViewControllerFormItem().title("Sliders & TextFields").viewController(SlidersAndTextFieldsViewController.self)
		builder += RFViewControllerFormItem().title("Precision Sliders").viewController(PrecisionSlidersViewController.self)
		builder += RFViewControllerFormItem().title("Reload Form").viewController(ReloadingViewController.self)
		builder += RFViewControllerFormItem().title("Work In Progress").viewController(WorkInProgressViewController.self)
	}
}
