// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

class TextCell: UITableViewCell, RFCellHeightProvider {
    @IBOutlet weak var label: UILabel!
    var xibHeight: CGFloat = 100

    static func createCell(text: String) throws -> TextCell {
		let cell: TextCell = try Bundle.main.rf_loadView("TextCell")

        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        let attrText = NSAttributedString(string: text,
                                          attributes: [ .font: font,
//                                                      .paragraphStyle: paragraphStyle
            ])
        
        cell.label.attributedText = attrText

		return cell
	}

    override func awakeFromNib() {
        super.awakeFromNib()
		xibHeight = bounds.height
        backgroundColor = UIColor.clear
    }

    func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        guard let attributedText: NSAttributedString = label.attributedText else {
            print("ERROR: Expected label.attributedText to be non-nil, but got nil")
            return xibHeight
        }
        
        let insets = UIEdgeInsets(top: 11, left: 16, bottom: 10.5, right: 16)
        
        let width: CGFloat = tableView.bounds.size.width - (insets.left + insets.right)
        let height: CGFloat = CGFloat.infinity
        let size = CGSize(width: width, height: height)
        
        let framesetter = CTFramesetterCreateWithAttributedString(attributedText)
        let suggestedSize: CGSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0, length: 0), nil, size, nil)
        
        return suggestedSize.height + (insets.top + insets.bottom)
    }
}
