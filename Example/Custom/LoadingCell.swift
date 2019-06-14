// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class LoadingCell: UITableViewCell, RFCellHeightProvider {
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	var xibHeight: CGFloat = 160

	static func createCell() throws -> LoadingCell {
		let cell: LoadingCell = try Bundle.main.rf_loadView("LoadingCell")
		return cell
	}

    override func awakeFromNib() {
        super.awakeFromNib()
		xibHeight = bounds.height
		activityIndicator.startAnimating()
    }

	func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
		return xibHeight
	}
}
