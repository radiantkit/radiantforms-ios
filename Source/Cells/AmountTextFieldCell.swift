// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

public struct AmountTextFieldFormItemCellModel {
    var title: String = ""
    var toolbarMode: ToolbarMode = .simple
    var placeholder: String = ""
    var returnKeyType: UIReturnKeyType = .default
    var model: AmountTextFieldFormItem! = nil
    
    var valueDidChange: (String) -> Void = { (value: String) in
        SwiftyFormLog("value \(value)")
    }
    
    var didEndEditing: (String) -> Void = { (value: String) in
        SwiftyFormLog("value \(value)")
    }
}

public class AmountTextFieldCell: UITableViewCell {
    
}
