// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public class ViewControllerCellModel {
	public let title: String
	public let placeholder: String
	public init(title: String, placeholder: String) {
		self.title = title
		self.placeholder = placeholder
	}
}

public class ViewControllerCell: UITableViewCell {
	public let model: ViewControllerCellModel
	let innerDidSelectRow: (ViewControllerCell, ViewControllerCellModel) -> Void

	public init(model: ViewControllerCellModel, didSelectRow: @escaping (ViewControllerCell, ViewControllerCellModel) -> Void) {
		self.model = model
		self.innerDidSelectRow = didSelectRow
		super.init(style: .value1, reuseIdentifier: nil)
		accessoryType = .disclosureIndicator
		textLabel?.text = model.title
        textLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
		detailTextLabel?.text = model.placeholder
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ViewControllerCell: SelectRowDelegate {
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

@available(*, unavailable, renamed: "ViewControllerCellModel")
typealias ViewControllerFormItemCellModel = ViewControllerCellModel
