// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

public struct RFTextCellModel {
    public var text: String = ""

    public init(text: String) {
        self.text = text
    }
}

public class RFTextCell: UITableViewCell {
    public var model: RFTextCellModel
    
    public init(model: RFTextCellModel) {
        self.model = model
        super.init(style: .default, reuseIdentifier: nil)
        textLabel?.numberOfLines = 0
        selectionStyle = .none
        loadWithModel(model)
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func loadWithModel(_ model: RFTextCellModel) {
        textLabel?.text = model.text
    }
}
