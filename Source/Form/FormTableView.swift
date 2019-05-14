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

public struct SwiftyFORM_Theme {
    fileprivate let tableViewBackground: SwiftyFORM_Theme_TableViewBackground
    fileprivate let tableViewSeparator: SwiftyFORM_Theme_TableViewSeparator
    fileprivate let sectionHeader: SwiftyFORM_Theme_SectionHeader
    fileprivate let sectionFooter: SwiftyFORM_Theme_SectionFooter
    fileprivate let cellBackground: SwiftyFORM_Theme_CellBackground
    
    public static func lightTheme() -> SwiftyFORM_Theme {
        return SwiftyFORM_Theme(
            tableViewBackground: .lightTheme,
            tableViewSeparator: .lightTheme,
            sectionHeader: .lightTheme,
            sectionFooter: .lightTheme,
            cellBackground: .lightTheme
        )
    }
    
    public static func darkTheme() -> SwiftyFORM_Theme {
        return SwiftyFORM_Theme(
            tableViewBackground: .darkTheme,
            tableViewSeparator: .darkTheme,
            sectionHeader: .darkTheme,
            sectionFooter: .darkTheme,
            cellBackground: .darkTheme
        )
    }
    
    public static func useSystemDefaultTheme() -> SwiftyFORM_Theme {
        return SwiftyFORM_Theme(
            tableViewBackground: .useSystemDefault,
            tableViewSeparator: .useSystemDefault,
            sectionHeader: .useSystemDefault,
            sectionFooter: .useSystemDefault,
            cellBackground: .useSystemDefault
        )
    }
}

fileprivate enum SwiftyFORM_Theme_TableViewBackground {
    case useSystemDefault, lightTheme, darkTheme
}

fileprivate enum SwiftyFORM_Theme_TableViewSeparator {
    case useSystemDefault, lightTheme, darkTheme
}

fileprivate enum SwiftyFORM_Theme_SectionHeader {
    case useSystemDefault, lightTheme, darkTheme
}

fileprivate enum SwiftyFORM_Theme_SectionFooter {
    case useSystemDefault, lightTheme, darkTheme
}

fileprivate enum SwiftyFORM_Theme_CellBackground {
    case useSystemDefault, lightTheme, darkTheme
}


fileprivate extension SwiftyFORM_Theme_SectionHeader {
    var textLabel_textColor: UIColor? {
        switch self {
        case .useSystemDefault:
            return nil
        case .lightTheme:
            return UIColor.darkGray
        case .darkTheme:
            return UIColor.white
        }
    }
}

fileprivate extension SwiftyFORM_Theme_SectionFooter {
    var textLabel_textColor: UIColor? {
        switch self {
        case .useSystemDefault:
            return nil
        case .lightTheme:
            return UIColor.lightGray
        case .darkTheme:
            return UIColor.white
        }
    }
}

fileprivate extension SwiftyFORM_Theme_TableViewBackground {
    var color: UIColor? {
        switch self {
        case .useSystemDefault:
            return nil
        case .lightTheme:
            return UIColor(white: 0.9, alpha: 1.0)
        case .darkTheme:
            return UIColor(white: 0.2, alpha: 1.0)
        }
    }
}

fileprivate extension SwiftyFORM_Theme_TableViewSeparator {
    var color: UIColor? {
        switch self {
        case .useSystemDefault:
            return nil
        case .lightTheme:
            return UIColor(white: 0.8, alpha: 1.0)
        case .darkTheme:
            return UIColor(white: 0.4, alpha: 1.0)
        }
    }
}

fileprivate extension SwiftyFORM_Theme_CellBackground {
    var color: UIColor? {
        switch self {
        case .useSystemDefault:
            return nil
        case .lightTheme:
            return UIColor(white: 0.95, alpha: 1.0)
        case .darkTheme:
            return UIColor(white: 0.3, alpha: 1.0)
        }
    }
}


