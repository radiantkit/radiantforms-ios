// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

public struct RFTextCellModel {
    var text: String = ""
}

/// Cell for displaying multiline text spanning the full width.
///
/// The cell is not selectable.
public class RFTextCell: UITableViewCell {
    public init(model: RFTextCellModel) {
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
