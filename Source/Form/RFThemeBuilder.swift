// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

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

    public func apply(_ containerTypes: UIAppearanceContainer.Type ...) {
        self.applyWhenContainedInInstancesOf(containerTypes)
    }
    
    @objc public func applyWhenContainedInInstancesOf(_ containerTypes: [UIAppearanceContainer.Type]) {
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
            self._tintColor = newValue
        }
    }
}
