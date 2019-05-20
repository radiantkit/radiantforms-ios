// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public class FormTableView: UITableView {
	public init() {
		super.init(frame: CGRect.zero, style: .grouped)
		contentInset = UIEdgeInsets.zero
		scrollIndicatorInsets = UIEdgeInsets.zero

		// Enable "Self Sizing Cells"
		estimatedRowHeight = 44.0
		rowHeight = UITableView.form_automaticDimension
	}

	public required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

    @objc public dynamic var sectionHeader_textLabel_textColor: UIColor?
    @objc public dynamic var sectionFooter_textLabel_textColor: UIColor?
    
    public static func configureAppearance(whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type], theme: SwiftyFORM_Theme) {

        do {
            let appearanceProxy: FormTableView = FormTableView.appearance(whenContainedInInstancesOf: containerTypes)
            appearanceProxy.sectionHeader_textLabel_textColor = theme.sectionHeader.textLabel_textColor
            appearanceProxy.sectionFooter_textLabel_textColor = theme.sectionFooter.textLabel_textColor
            if let color: UIColor = theme.tableViewBackground.color {
                appearanceProxy.backgroundColor = color
            }
            if let color: UIColor = theme.tableViewSeparator.color {
                appearanceProxy.separatorColor = color
            }
        }

        do {
            let allContainerTypes: [UIAppearanceContainer.Type] = [FormTableView.self] + containerTypes
            let appearanceProxy: UITableViewCell = UITableViewCell.appearance(whenContainedInInstancesOf: allContainerTypes)
            if let color: UIColor = theme.cellBackground.color {
                appearanceProxy.backgroundColor = color
            }
        }

        do {
            let allContainerTypes: [UIAppearanceContainer.Type] = [FormTableView.self] + containerTypes
            AmountCell.configureAppearance(whenContainedInInstancesOf: allContainerTypes)
        }
    }
}
