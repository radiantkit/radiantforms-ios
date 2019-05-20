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
            appearanceProxy.backgroundColor = theme.tableViewBackground.color
            appearanceProxy.separatorColor = theme.tableViewSeparator.color
        }

        do {
            let allContainerTypes: [UIAppearanceContainer.Type] = [FormTableView.self] + containerTypes
            let appearanceProxy: UITableViewCell = UITableViewCell.appearance(whenContainedInInstancesOf: allContainerTypes)
            appearanceProxy.backgroundColor = theme.cellBackground.color
        }

        do {
            let allContainerTypes: [UIAppearanceContainer.Type] = [FormTableView.self] + containerTypes
            AmountCell.configureAppearance(whenContainedInInstancesOf: allContainerTypes, theme: theme)
        }
        
        do {
            let allContainerTypes: [UIAppearanceContainer.Type] = [FormTableView.self] + containerTypes
            ButtonCell.configureAppearance(whenContainedInInstancesOf: allContainerTypes, theme: theme)
        }
    }
}
