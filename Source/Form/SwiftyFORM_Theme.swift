// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.

public struct SwiftyFORM_Theme {
    internal let tableViewBackground: SwiftyFORM_Theme_TableViewBackground
    internal let tableViewSeparator: SwiftyFORM_Theme_TableViewSeparator
    internal let sectionHeader: SwiftyFORM_Theme_SectionHeader
    internal let sectionFooter: SwiftyFORM_Theme_SectionFooter
    internal let cellBackground: SwiftyFORM_Theme_CellBackground
    
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
}

internal enum SwiftyFORM_Theme_TableViewBackground {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_TableViewSeparator {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_SectionHeader {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_SectionFooter {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_CellBackground {
    case lightTheme, darkTheme
}


internal extension SwiftyFORM_Theme_SectionHeader {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.darkGray
        case .darkTheme:
            return UIColor.white
        }
    }
}

internal extension SwiftyFORM_Theme_SectionFooter {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.lightGray
        case .darkTheme:
            return UIColor.white
        }
    }
}

internal extension SwiftyFORM_Theme_TableViewBackground {
    var color: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(white: 0.9, alpha: 1.0)
        case .darkTheme:
            return UIColor(white: 0.25, alpha: 1.0)
        }
    }
}

internal extension SwiftyFORM_Theme_TableViewSeparator {
    var color: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(white: 0.8, alpha: 1.0)
        case .darkTheme:
            return UIColor(white: 0.4, alpha: 1.0)
        }
    }
}

internal extension SwiftyFORM_Theme_CellBackground {
    var color: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(white: 0.95, alpha: 1.0)
        case .darkTheme:
            return UIColor(white: 0.2, alpha: 1.0)
        }
    }
}


