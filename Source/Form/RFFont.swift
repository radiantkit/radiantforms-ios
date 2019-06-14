// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

public protocol RFFont {
    func resolve() -> UIFont
}


/// This strategy creates a `UIFont` instance using the preferred font of the user.
/// The user can have customized accessibility settings, so the font may sometimes be larger and bolder.
public class RFPreferredFontForTextStyle {
    private var textStyle: UIFont.TextStyle
    
    public init(textStyle: UIFont.TextStyle) {
        self.textStyle = textStyle
    }
    
    /// Creates a `UIFont.TextStyle.body`
    public static var body: RFFont {
        return RFPreferredFontForTextStyle(textStyle: .body)
    }
    
    /// Creates a `UIFont.TextStyle.headline`
    public static var headline: RFFont {
        return RFPreferredFontForTextStyle(textStyle: .headline)
    }
}

extension RFPreferredFontForTextStyle: RFFont {
    public func resolve() -> UIFont {
        return UIFont.preferredFont(forTextStyle: self.textStyle)
    }
}
