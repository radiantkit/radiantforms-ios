// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

extension UITableView {
    public static var form_automaticDimension: CGFloat {
        #if swift(>=4.2)
            // 'automaticDimensions' was introduced in Swift 4.2
            return UITableView.automaticDimension
        #else
            // Swift 4.0 and earlier
            return UITableViewAutomaticDimension
        #endif
    }
}
