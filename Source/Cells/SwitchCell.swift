// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public struct SwitchCellModel {
	var title: String = ""

	var valueDidChange: (Bool) -> Void = { (value: Bool) in
		SwiftyFormLog("value \(value)")
	}
}

public class SwitchCell: UITableViewCell {
	public let model: SwitchCellModel
	public let switchView: UISwitch

	public init(model: SwitchCellModel) {
		self.model = model
		self.switchView = UISwitch()
		super.init(style: .default, reuseIdentifier: nil)
		selectionStyle = .none
        textLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
		textLabel?.text = model.title

		switchView.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
		accessoryView = switchView
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    // MARK: - UIAppearance
    
    @objc public dynamic var textLabel_textColor: UIColor?
    @objc public dynamic var switch_onTintColor: UIColor?
    
    public static func configureAppearance(whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type], theme: RFTheme) {
        let appearanceProxy: SwitchCell = SwitchCell.appearance(whenContainedInInstancesOf: containerTypes)
        appearanceProxy.textLabel_textColor = theme.switchCell.textLabel_textColor
        appearanceProxy.switch_onTintColor = theme.switchCell.switch_onTintColor
    }
    
	@objc public func valueChanged() {
		SwiftyFormLog("value did change")
		model.valueDidChange(switchView.isOn)
	}

	public func setValueWithoutSync(_ value: Bool, animated: Bool) {
		SwiftyFormLog("set value \(value), animated \(animated)")
		switchView.setOn(value, animated: animated)
	}
}

extension SwitchCell: WillDisplayCellDelegate {
    public func form_willDisplay(tableView: UITableView, forRowAtIndexPath indexPath: IndexPath) {
        self.textLabel?.textColor = self.textLabel_textColor
        self.switchView.onTintColor = self.switch_onTintColor
    }
}
