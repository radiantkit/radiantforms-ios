// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public class ViewControllerFormItemCellModel {
	public let title: String
	public let placeholder: String
	public init(title: String, placeholder: String) {
		self.title = title
		self.placeholder = placeholder
	}
}

public class ViewControllerCell: UITableViewCell, SelectRowDelegate {
	public let model: ViewControllerFormItemCellModel
	let innerDidSelectRow: (ViewControllerCell, ViewControllerFormItemCellModel) -> Void

	public init(model: ViewControllerFormItemCellModel, didSelectRow: @escaping (ViewControllerCell, ViewControllerFormItemCellModel) -> Void) {
		self.model = model
		self.innerDidSelectRow = didSelectRow
		super.init(style: .value1, reuseIdentifier: nil)
		accessoryType = .disclosureIndicator
		textLabel?.text = model.title
		detailTextLabel?.text = model.placeholder
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func form_didSelectRow(indexPath: IndexPath, tableView: UITableView) {
		SwiftyFormLog("will invoke")
		// hide keyboard when the user taps this kind of row
		tableView.form_firstResponder()?.resignFirstResponder()

		innerDidSelectRow(self, model)
		SwiftyFormLog("did invoke")
	}
}

@available(*, unavailable, renamed: "ViewControllerCell")
typealias ViewControllerFormItemCell = ViewControllerCell
