// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

public protocol RFPopulateFont {
    func titleFont() -> RFFont
    func valueFont() -> RFFont
}

public class RFPopulateFont_Default: RFPopulateFont {
    public func titleFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
    
    public func valueFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
}

public class RFPopulateFont_BoldTitle: RFPopulateFont {
    public func titleFont() -> RFFont {
        return RFPreferredFontForTextStyle.headline
    }
    
    public func valueFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
}
