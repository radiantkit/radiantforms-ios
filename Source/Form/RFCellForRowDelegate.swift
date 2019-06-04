// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public protocol RFCellForRowDelegate {
	func form_cellForRow(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}

@available(*, unavailable, renamed: "RFCellForRowDelegate")
typealias CellForRowDelegate = RFCellForRowDelegate
