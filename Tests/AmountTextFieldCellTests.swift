// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import XCTest
import UIKit
@testable import SwiftyFORM

class AmountTextFieldCellTests: XCTestCase {
    
    func testRemoveFormatFromString() {
        XCTAssertEqual(AmountFieldCell.removeFormatFromString(" 1,234.56 "), "123456")
        XCTAssertEqual(AmountFieldCell.removeFormatFromString("0001234"), "0001234")
    }
    
    func testParseAndFormatAmount() {
        let formItem = AmountFieldFormItem()
        formItem.maxIntegerDigits(4).fractionDigits(2)
        let cell: AmountFieldCell = createCell(formItem)
        XCTAssertEqual(cell.parseAndFormatAmount(""), "")
        XCTAssertEqual(cell.parseAndFormatAmount("0"), "")
        XCTAssertEqual(cell.parseAndFormatAmount(" 00123456 "), "1,234.56", "discard leading zeroes")
    }

    // MARK: - Set initial value
    
    func testInitialValue0() {
        let formItem = AmountFieldFormItem()
        formItem.maxIntegerDigits(10).fractionDigits(0)
        formItem.value = "1234567890"
        let cell: AmountFieldCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0")
        XCTAssertEqual(cell.formatAmount(1), "1")
        XCTAssertEqual(cell.formatAmount(123), "123")
        XCTAssertEqual(cell.formatAmount(123456), "123,456")
    }
    
    func testInitialValue1() {
        let formItem = AmountFieldFormItem()
        formItem.maxIntegerDigits(4).fractionDigits(2)
        formItem.value = "123456"
        let cell: AmountFieldCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0.00")
        XCTAssertEqual(cell.formatAmount(1), "0.01")
        XCTAssertEqual(cell.formatAmount(123), "1.23")
        XCTAssertEqual(cell.formatAmount(123456), "1,234.56")
    }
    
    // MARK: - Don't set any initial value
    
    func testNoInitialValue0() {
        let formItem = AmountFieldFormItem()
        formItem.maxIntegerDigits(5).fractionDigits(0)
        let cell: AmountFieldCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0")
        XCTAssertEqual(cell.formatAmount(1), "1")
        XCTAssertEqual(cell.formatAmount(123), "123")
        XCTAssertEqual(cell.formatAmount(123456), "123,456")
    }
    
    func testNoInitialValue1() {
        let formItem = AmountFieldFormItem()
        formItem.maxIntegerDigits(5).fractionDigits(2)
        let cell: AmountFieldCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0.00")
        XCTAssertEqual(cell.formatAmount(1), "0.01")
        XCTAssertEqual(cell.formatAmount(123), "1.23")
        XCTAssertEqual(cell.formatAmount(123456), "1,234.56")
    }
    
    // MARK: - Helper
    
    func createCell(_ formItem: AmountFieldFormItem) -> AmountFieldCell {
        let populateTableViewModel = PopulateTableViewModel(viewController: UIViewController(), toolbarMode: .none)
        let populateTableView = PopulateTableView(model: populateTableViewModel)
        assert(populateTableView.cells.allItems.count == 0)
        formItem.accept(visitor: populateTableView)
        assert(populateTableView.cells.allItems.count == 1)
        guard let item: TableViewCellArrayItem = populateTableView.cells.allItems.first else {
            fatalError("Expected PopulateTableView to have created at least 1 item")
        }
        guard let cell: AmountFieldCell = item.cell as? AmountFieldCell else {
            fatalError("Expected firstItem.cell to be of type AmountTextFieldCell")
        }
        return cell
    }
}
