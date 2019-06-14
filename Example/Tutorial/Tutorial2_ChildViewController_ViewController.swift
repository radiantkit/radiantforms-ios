// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import SwiftyFORM

class Tutorial2_ChildViewController_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += RFViewControllerFormItem().title("Go to view controller").viewController(FirstViewController.self)
	}
}
