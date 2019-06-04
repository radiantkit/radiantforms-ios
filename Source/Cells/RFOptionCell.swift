// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public class RFOptionCell: UITableViewCell, RFSelectRowDelegate {
	let innerDidSelectOption: () -> Void

	public init(model: OptionRowFormItem, didSelectOption: @escaping () -> Void) {
		self.innerDidSelectOption = didSelectOption
		super.init(style: .default, reuseIdentifier: nil)
		loadWithModel(model)
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func loadWithModel(_ model: OptionRowFormItem) {
		textLabel?.text = model.title
		if model.selected {
			accessoryType = .checkmark
		} else {
			accessoryType = .none
		}
	}

	public func form_didSelectRow(indexPath: IndexPath, tableView: UITableView) {
		SwiftyFormLog("will invoke")
		accessoryType = .checkmark

		tableView.deselectRow(at: indexPath, animated: true)

		innerDidSelectOption()
		SwiftyFormLog("did invoke")
	}
}

@available(*, unavailable, renamed: "RFOptionCell")
typealias OptionCell = RFOptionCell
