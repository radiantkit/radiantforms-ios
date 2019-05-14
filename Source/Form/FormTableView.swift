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
    
    public static func configureAppearance(whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type]) {
        let appearanceProxy: FormTableView = FormTableView.appearance(whenContainedInInstancesOf: containerTypes)
        appearanceProxy.sectionHeader_textLabel_textColor = UIColor.darkGray
        appearanceProxy.sectionFooter_textLabel_textColor = UIColor.lightGray
    }
}
