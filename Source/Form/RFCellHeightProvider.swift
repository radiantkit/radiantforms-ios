// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit

public protocol RFCellHeightProvider {
	func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat
}

@available(*, unavailable, renamed: "RFCellHeightProvider")
typealias CellHeightProvider = RFCellHeightProvider
