// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

public class RFViewControllerCellModel {
	public let title: String
	public let placeholder: String
    public var titleFont: RFFont = RFPreferredFontForTextStyle.body
	public init(title: String, placeholder: String) {
		self.title = title
		self.placeholder = placeholder
	}
}

public class RFViewControllerCell: UITableViewCell {
	public let model: RFViewControllerCellModel
	let innerDidSelectRow: (RFViewControllerCell, RFViewControllerCellModel) -> Void

	public init(model: RFViewControllerCellModel, didSelectRow: @escaping (RFViewControllerCell, RFViewControllerCellModel) -> Void) {
		self.model = model
		self.innerDidSelectRow = didSelectRow
		super.init(style: .value1, reuseIdentifier: nil)
		accessoryType = .disclosureIndicator
		textLabel?.text = model.title
        textLabel?.font = model.titleFont.resolve()
		detailTextLabel?.text = model.placeholder
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    // MARK: - UIAppearance
    
    @objc public dynamic var textLabel_textColor: UIColor?
    
    public static func configureAppearance(whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type], theme: RFTheme) {
        let appearanceProxy: RFViewControllerCell = RFViewControllerCell.appearance(whenContainedInInstancesOf: containerTypes)
        appearanceProxy.textLabel_textColor = theme.viewControllerCell.textLabel_textColor
    }
}

extension RFViewControllerCell: RFSelectRowDelegate {
	public func form_didSelectRow(indexPath: IndexPath, tableView: UITableView) {
		SwiftyFormLog("will invoke")
		// hide keyboard when the user taps this kind of row
		tableView.rf_firstResponder()?.resignFirstResponder()

		innerDidSelectRow(self, model)
		SwiftyFormLog("did invoke")
	}
}

extension RFViewControllerCell: RFWillDisplayCellDelegate {
    public func form_willDisplay(tableView: UITableView, forRowAtIndexPath indexPath: IndexPath) {
        self.textLabel?.textColor = self.textLabel_textColor
    }
}

@available(*, unavailable, renamed: "RFViewControllerCell")
typealias ViewControllerFormItemCell = RFViewControllerCell

@available(*, unavailable, renamed: "RFViewControllerCellModel")
typealias ViewControllerFormItemCellModel = RFViewControllerCellModel
