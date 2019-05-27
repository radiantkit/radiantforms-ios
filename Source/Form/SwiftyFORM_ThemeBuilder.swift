// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

public class SwiftyFORM_ThemeBuilder: NSObject {
    private var theme: SwiftyFORM_Theme
    
    @objc public override init() {
        self.theme = SwiftyFORM_Theme.lightTheme()
        super.init()
    }
    
    @objc public func apply() {
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [],
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
