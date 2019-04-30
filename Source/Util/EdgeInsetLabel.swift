// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

/// `UILabel` with padding around it, inspired by:
/// https://stackoverflow.com/questions/21167226/resizing-a-uilabel-to-accommodate-insets/21267507#21267507
/// https://stackoverflow.com/a/55437367/78336
public class EdgeInsetLabel: UILabel {
    public var edgeInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: edgeInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -edgeInsets.top,
                                          left: -edgeInsets.left,
                                          bottom: -edgeInsets.bottom,
                                          right: -edgeInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: edgeInsets))
    }
}
