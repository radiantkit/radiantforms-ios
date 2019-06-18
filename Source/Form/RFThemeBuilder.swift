// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

/// UIViewController has no appearance proxy. This singleton serves the same purpose.
internal class RFFontStrategySingleton {
    static let shared = RFFontStrategySingleton()

    typealias TypeName2FontStrategy = [String: RFFontStrategy]
    var dict = TypeName2FontStrategy()
    
    func register(containerTypes: [UIAppearanceContainer.Type], theme: RFTheme) {
        guard containerTypes.count <= 1 else {
            print("ERROR: Expected containerTypes array to be exactly 1 element, but got more. Cannot register fontStrategy.")
            return
        }
        guard let firstContainerType: UIAppearanceContainer.Type = containerTypes.first else {
            print("ERROR: Expected containerTypesarray to be exactly 1 element, but got less. Cannot register fontStrategy.")
            return
        }
        guard let vctype = firstContainerType as? RFFormViewController.Type else {
            print("ERROR: Expected vc to be subclass of RFFormViewController. Cannot register fontStrategy.")
            return
        }
        
        let typename: String = String(describing: vctype)
        //print("typename: '\(typename)'")
        
        let fontStrategy: RFFontStrategy = theme.fontStrategy.resolveFontStrategy()
        //print("fontStrategy: '\(type(of: fontStrategy))'")
        
        self.dict[typename] = fontStrategy
        print("registered typename: '\(typename)'  fontStrategy: '\(type(of: fontStrategy))'")
    }

    func find(containerTypes: [UIAppearanceContainer.Type]) -> RFFontStrategy? {
        guard containerTypes.count <= 1 else {
            print("ERROR: Expected containerTypes array to be exactly 1 element, but got more. Cannot register fontStrategy.")
            return nil
        }
        guard let firstContainerType: UIAppearanceContainer.Type = containerTypes.first else {
            print("ERROR: Expected containerTypesarray to be exactly 1 element, but got less. Cannot register fontStrategy.")
            return nil
        }
        guard let vctype = firstContainerType as? RFFormViewController.Type else {
            print("ERROR: Expected vc to be subclass of RFFormViewController. Cannot register fontStrategy.")
            return nil
        }
        
        let typename: String = String(describing: vctype)
        //print("typename: '\(typename)'")
        
        let fontStrategyOrNil: RFFontStrategy? = self.dict[typename]
        return fontStrategyOrNil
    }

    func resolve(containerTypes: [UIAppearanceContainer.Type]) -> RFFontStrategy {
        let fontStrategyOrNil: RFFontStrategy? = self.find(containerTypes: containerTypes)
        if let fontStrategy: RFFontStrategy = fontStrategyOrNil {
            print("Resolve: Found registered fontStrategy. fontStrategy: '\(type(of: fontStrategy))'")
            return fontStrategy
        } else {
            print("No registered fontStrategy. Using default font strategy.")
            return RFFontStrategy_Default()
        }
    }
}

public class RFThemeBuilder: NSObject {
    private var theme: RFTheme

    public init(theme: RFTheme) {
        self.theme = theme
        super.init()
    }
    
    @objc public static var light: RFThemeBuilder {
        return RFThemeBuilder(theme: RFTheme.lightTheme())
    }
    
    @objc public static var dark: RFThemeBuilder {
        return RFThemeBuilder(theme: RFTheme.darkTheme())
    }
    
    @objc public func apply() {
        self.applyWhenContainedInInstancesOf([])
    }
    
    public func applyTo(_ containerTypes: UIAppearanceContainer.Type ...) {
        self.applyWhenContainedInInstancesOf(containerTypes)
    }
    
    @objc public func applyWhenContainedInInstancesOf(_ containerTypes: [UIAppearanceContainer.Type]) {
        RFFontStrategySingleton.shared.register(
            containerTypes: containerTypes,
            theme: self.theme
        )

        RFFormTableView.configureAppearance(
            whenContainedInInstancesOf: containerTypes,
            theme: self.theme
        )
    }
    
    private var _tintColor: UIColor?
    
    @objc public var tintColor: UIColor? {
        get {
            return self._tintColor
        }
        set {
            if let color: UIColor = newValue {
                theme.amountCell = RFTheme_AmountCell.textField_textColor(color: color, theme: theme.amountCell)
                theme.amountCell = RFTheme_AmountCell.textField_tintColor(color: color, theme: theme.amountCell)
                theme.optionViewControllerCell = RFTheme_OptionViewControllerCell.detailTextLabel_textColor(color: color, theme: theme.optionViewControllerCell)
                theme.textFieldCell = RFTheme_TextFieldCell.textField_textColor(color: color, theme: theme.textFieldCell)
                theme.textFieldCell = RFTheme_TextFieldCell.textField_tintColor(color: color, theme: theme.textFieldCell)
            }
            self._tintColor = newValue
        }
    }
    
    @objc public func useTintFirstResponderStrategy() {
        theme.amountCell = RFTheme_AmountCell.textField_appearanceStrategy_useTintFirstResponder(theme: theme.amountCell)
        theme.textFieldCell = RFTheme_TextFieldCell.textField_appearanceStrategy_useTintFirstResponder(theme: theme.textFieldCell)
    }
    
    @objc public func useBoldTitleFontStrategy() {
        theme.fontStrategy = RFTheme_FontStrategy.boldTitle
    }
}
