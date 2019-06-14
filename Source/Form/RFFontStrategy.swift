// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

public protocol RFFontStrategy {
    func titleFont() -> RFFont
    func valueFont() -> RFFont
}

public class RFFontStrategy_Default: RFFontStrategy {
    public func titleFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
    
    public func valueFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
}

public class RFFontStrategy_BoldTitle: RFFontStrategy {
    public func titleFont() -> RFFont {
        return RFPreferredFontForTextStyle.headline
    }
    
    public func valueFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
}
