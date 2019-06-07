// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class StoryboardDemoViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Storyboard Demo"
		builder += voteCountSlider
		builder += RFSectionHeaderTitleFormItem()
		builder += voteButton
	}
	
	lazy var voteCountSlider: RFPrecisionSliderFormItem = {
		let instance = RFPrecisionSliderFormItem().decimalPlaces(0).minimumValue(0).maximumValue(1000).value(500).behavior(.expandedAlways)
		instance.title = "Vote Count"
		return instance
	}()
	
	lazy var voteButton: RFButtonFormItem = {
		let instance = RFButtonFormItem()
		instance.title = "Submit Vote"
		instance.action = { [weak self] in
			self?.voteButtonAction()
		}
		return instance
	}()
	
	func voteButtonAction() {
		let value: Int = Int(voteCountSlider.actualValue)
		let config = VoteViewControllerConfig(voteCount: value)
		let vc = VoteViewController.create(config: config)
		navigationController?.pushViewController(vc, animated: true)
	}
}
