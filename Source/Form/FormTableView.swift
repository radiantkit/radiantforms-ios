// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public enum SwiftyFORM_ThemeMode {
    case none, light, dark
}

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
    
    public static func configureAppearance(whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type], themeMode: SwiftyFORM_ThemeMode) {

        let appearanceProxy: FormTableView = FormTableView.appearance(whenContainedInInstancesOf: containerTypes)
        appearanceProxy.sectionHeader_textLabel_textColor = themeMode.sectionHeader_textLabel_textColor
        appearanceProxy.sectionFooter_textLabel_textColor = themeMode.sectionFooter_textLabel_textColor

    }
}

fileprivate extension SwiftyFORM_ThemeMode {
    var sectionHeader_textLabel_textColor: UIColor? {
        switch self {
        case .none:
            return nil
        case .light:
            return UIColor.darkGray
        case .dark:
            return UIColor.white
        }
    }
    
    var sectionFooter_textLabel_textColor: UIColor? {
        switch self {
        case .none:
            return nil
        case .light:
            return UIColor.lightGray
        case .dark:
            return UIColor.white
        }
    }
}
