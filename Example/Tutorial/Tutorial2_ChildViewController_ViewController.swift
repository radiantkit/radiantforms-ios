// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import SwiftyFORM

class Tutorial2_ChildViewController_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += ViewControllerFormItem().title("Go to view controller").viewController(FirstViewController.self)
	}
}
