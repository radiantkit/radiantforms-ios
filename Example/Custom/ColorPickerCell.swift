// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

enum ColorPickerCellValue {
    case red
    case green
    case blue
}

typealias ColorPickerCell_DidPickValue = (_ value: ColorPickerCellValue) -> Void

class ColorPickerCell: UITableViewCell {
    var xibHeight: CGFloat = 160
    var didPickValue: ColorPickerCell_DidPickValue?
    
    static func createCell() throws -> ColorPickerCell {
        let cell: ColorPickerCell = try Bundle.main.rf_loadView("ColorPickerCell")
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibHeight = bounds.height
    }
    
    @IBAction func redButtonAction() {
        didPickValue?(ColorPickerCellValue.red)
    }
    
    @IBAction func greenButtonAction() {
        didPickValue?(ColorPickerCellValue.green)
    }
    
    @IBAction func blueButtonAction() {
        didPickValue?(ColorPickerCellValue.blue)
    }
}

extension ColorPickerCell: RFCellHeightProvider {
    func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return xibHeight
    }
}
