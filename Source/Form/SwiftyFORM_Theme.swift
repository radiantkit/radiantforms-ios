// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.

public struct SwiftyFORM_Theme {
    internal let tableViewBackground: SwiftyFORM_Theme_TableViewBackground
    internal let tableViewSeparator: SwiftyFORM_Theme_TableViewSeparator
    internal let sectionHeader: SwiftyFORM_Theme_SectionHeader
    internal let sectionFooter: SwiftyFORM_Theme_SectionFooter
    internal let cellBackground: SwiftyFORM_Theme_CellBackground
    internal let amountCell: SwiftyFORM_Theme_AmountCell
    internal let buttonCell: SwiftyFORM_Theme_ButtonCell
    internal let datePickerCell: SwiftyFORM_Theme_DatePickerCell
    internal let segmentedControlCell: SwiftyFORM_Theme_SegmentedControlCell
    internal let stepperCell: SwiftyFORM_Theme_StepperCell
    internal let switchCell: SwiftyFORM_Theme_SwitchCell
    internal let textFieldCell: SwiftyFORM_Theme_TextFieldCell
    internal let viewControllerCell: SwiftyFORM_Theme_ViewControllerCell
    
    public static func lightTheme() -> SwiftyFORM_Theme {
        return SwiftyFORM_Theme(
            tableViewBackground: .lightTheme,
            tableViewSeparator: .lightTheme,
            sectionHeader: .lightTheme,
            sectionFooter: .lightTheme,
            cellBackground: .lightTheme,
            amountCell: .lightTheme,
            buttonCell: .lightTheme,
            datePickerCell: .lightTheme,
            segmentedControlCell: .lightTheme,
            stepperCell: .lightTheme,
            switchCell: .lightTheme,
            textFieldCell: .lightTheme,
            viewControllerCell: .lightTheme
        )
    }
    
    public static func darkTheme() -> SwiftyFORM_Theme {
        return SwiftyFORM_Theme(
            tableViewBackground: .darkTheme,
            tableViewSeparator: .darkTheme,
            sectionHeader: .darkTheme,
            sectionFooter: .darkTheme,
            cellBackground: .darkTheme,
            amountCell: .darkTheme,
            buttonCell: .darkTheme,
            datePickerCell: .darkTheme,
            segmentedControlCell: .darkTheme,
            stepperCell: .darkTheme,
            switchCell: .darkTheme,
            textFieldCell: .darkTheme,
            viewControllerCell: .darkTheme
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

internal enum SwiftyFORM_Theme_AmountCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_ButtonCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_DatePickerCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_SegmentedControlCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_StepperCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_SwitchCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_TextFieldCell {
    case lightTheme, darkTheme
}

internal enum SwiftyFORM_Theme_ViewControllerCell {
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
            return UIColor(white: 0.0, alpha: 1.0)
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

internal extension SwiftyFORM_Theme_AmountCell {
    var titleLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }

    var rightView_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }

    var textField_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0.558, green: 0.558, blue: 0.578, alpha: 1)
        case .darkTheme:
            return UIColor(red: 0.558, green: 0.558, blue: 0.578, alpha: 1)
        }
    }
    
    var textField_keyboardAppearance: UIKeyboardAppearance {
        switch self {
        case .lightTheme:
            return .light
        case .darkTheme:
            return .dark
        }
    }

    var textField_placeholderColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(white: 0.7, alpha: 1)
        case .darkTheme:
            return UIColor(white: 0.4, alpha: 1)
        }
    }

    var textField_tintColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        case .darkTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        }
    }
    
    var textField_appearanceStrategy: TextFieldAppearanceStrategy {
        return TextFieldAppearanceStrategy_TintFirstResponder(
//        return TextFieldAppearanceStrategy_Default(
            tintColor: self.textField_tintColor,
            textColor: self.textField_textColor
        )
    }
}

internal extension SwiftyFORM_Theme_ButtonCell {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
}

internal extension SwiftyFORM_Theme_DatePickerCell {
    var row_tintColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        case .darkTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        }
    }
    
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
    
    var detailTextLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.gray
        case .darkTheme:
            return UIColor.gray
        }
    }
}

internal extension SwiftyFORM_Theme_SegmentedControlCell {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
    
    var segmentedControl_tintColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        case .darkTheme:
            return UIColor.white
        }
    }
}

internal extension SwiftyFORM_Theme_SwitchCell {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
    
    var switch_onTintColor: UIColor {
        return UIColor(red: 0.298, green: 0.85, blue: 0.39, alpha: 1)
    }
}

internal extension SwiftyFORM_Theme_StepperCell {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
    
    var valueLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0.558, green: 0.558, blue: 0.578, alpha: 1)
        case .darkTheme:
            return UIColor(red: 0.558, green: 0.558, blue: 0.578, alpha: 1)
        }
    }
    
    var stepper_tintColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        case .darkTheme:
            return UIColor.white
        }
    }
}

internal extension SwiftyFORM_Theme_TextFieldCell {
    var titleLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
    
    var textField_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0.558, green: 0.558, blue: 0.578, alpha: 1)
        case .darkTheme:
            return UIColor(red: 0.558, green: 0.558, blue: 0.578, alpha: 1)
        }
    }
    
    var textField_keyboardAppearance: UIKeyboardAppearance {
        switch self {
        case .lightTheme:
            return .light
        case .darkTheme:
            return .dark
        }
    }
    
    var textField_placeholderColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(white: 0.7, alpha: 1)
        case .darkTheme:
            return UIColor(white: 0.4, alpha: 1)
        }
    }
    
    var textField_tintColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        case .darkTheme:
            return UIColor(red: 0, green: 0.45, blue: 1, alpha: 1)
        }
    }
    
    var textField_appearanceStrategy: TextFieldAppearanceStrategy {
        return TextFieldAppearanceStrategy_TintFirstResponder(
//        return TextFieldAppearanceStrategy_Default(
            tintColor: self.textField_tintColor,
            textColor: self.textField_textColor
        )
    }
    
    var errorLabel_textColor: UIColor {
        return UIColor.red
    }
}

internal extension SwiftyFORM_Theme_ViewControllerCell {
    var textLabel_textColor: UIColor {
        switch self {
        case .lightTheme:
            return UIColor.black
        case .darkTheme:
            return UIColor.white
        }
    }
}
