// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import XCTest
import UIKit
@testable import SwiftyFORM

class RFAmountCellTests: XCTestCase {
    
    func testExtractDigitsFromString() {
        XCTAssertEqual(RFAmountCell.extractDigitsFromString(""), "")
        XCTAssertEqual(RFAmountCell.extractDigitsFromString(" 1,234.56 "), "123456")
        XCTAssertEqual(RFAmountCell.extractDigitsFromString("0001234"), "0001234")
        XCTAssertEqual(RFAmountCell.extractDigitsFromString("1 234 567"), "1234567")
        XCTAssertEqual(RFAmountCell.extractDigitsFromString("-1"), "1")
    }
    
    func testParseAndFormatAmount() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(4).fractionDigits(2)
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.parseAndFormatAmount(0), "")
        XCTAssertEqual(cell.parseAndFormatAmount(123456), "1,234.56", "discard leading zeroes")
    }

    // MARK: - Set initial value
    
    func testInitialValue0() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(10).fractionDigits(0)
        formItem.value = 1234567890
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0")
        XCTAssertEqual(cell.formatAmount(1), "1")
        XCTAssertEqual(cell.formatAmount(123), "123")
        XCTAssertEqual(cell.formatAmount(123456), "123,456")
    }
    
    func testInitialValue1() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(4).fractionDigits(2)
        formItem.value = 123456
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0.00")
        XCTAssertEqual(cell.formatAmount(1), "0.01")
        XCTAssertEqual(cell.formatAmount(123), "1.23")
        XCTAssertEqual(cell.formatAmount(123456), "1,234.56")
    }
    
    // MARK: - Don't set any initial value
    
    func testNoInitialValue0() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(5).fractionDigits(0)
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0")
        XCTAssertEqual(cell.formatAmount(1), "1")
        XCTAssertEqual(cell.formatAmount(123), "123")
        XCTAssertEqual(cell.formatAmount(123456), "123,456")
    }
    
    func testNoInitialValue1() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(5).fractionDigits(2)
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0.00")
        XCTAssertEqual(cell.formatAmount(1), "0.01")
        XCTAssertEqual(cell.formatAmount(123), "1.23")
        XCTAssertEqual(cell.formatAmount(123456), "1,234.56")
    }
    
    // MARK: - NumberFormatter

    func testNumberFormatter0() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(10).fractionDigits(0)
        formItem.numberFormatter = self.createNumberFormattter(fractionDigits: 0, decimalSeparator: ",", groupingSeparator: ".")
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0")
        XCTAssertEqual(cell.formatAmount(1), "1")
        XCTAssertEqual(cell.formatAmount(123), "123")
        XCTAssertEqual(cell.formatAmount(1234567), "1.234.567")
    }
    
    func testNumberFormatter1() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(5).fractionDigits(2)
        formItem.numberFormatter = self.createNumberFormattter(fractionDigits: 2, decimalSeparator: ",", groupingSeparator: ".")
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0,00")
        XCTAssertEqual(cell.formatAmount(1), "0,01")
        XCTAssertEqual(cell.formatAmount(123), "1,23")
        XCTAssertEqual(cell.formatAmount(123456), "1.234,56")
    }
    
    func testNumberFormatter2() {
        let formItem = RFAmountFormItem()
        formItem.maxIntegerDigits(6).fractionDigits(4)
        formItem.numberFormatter = self.createNumberFormattter(fractionDigits: 4, decimalSeparator: ".", groupingSeparator: " ")
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0.0000")
        XCTAssertEqual(cell.formatAmount(1), "0.0001")
        XCTAssertEqual(cell.formatAmount(123), "0.0123")
        XCTAssertEqual(cell.formatAmount(123456), "12.3456")
        XCTAssertEqual(cell.formatAmount(12345678), "1 234.5678")
        XCTAssertEqual(cell.formatAmount(12345670000), "1 234 567.0000")
    }

    func testNumberFormatter3() {
        let formItem = RFAmountFormItem()
        formItem.numberFormatter = self.createNumberFormattter(
            fractionDigits: formItem.fractionDigits,
            decimalSeparator: "_d_",
            groupingSeparator: "_g_"
        )
        let cell: RFAmountCell = createCell(formItem)
        XCTAssertEqual(cell.formatAmount(0), "0_d_000")
        XCTAssertEqual(cell.formatAmount(1), "0_d_001")
        XCTAssertEqual(cell.formatAmount(123), "0_d_123")
        XCTAssertEqual(cell.formatAmount(123456), "123_d_456")
        XCTAssertEqual(cell.formatAmount(1234567), "1_g_234_d_567")
    }
    
    // MARK: - Helper
    
    func createCell(_ formItem: RFAmountFormItem) -> RFAmountCell {
        let populateTableViewModel = RFPopulateTableViewModel(viewController: UIViewController(), toolbarMode: .none)
        let populateTableView = RFPopulateTableView(model: populateTableViewModel)
        assert(populateTableView.cells.allItems.count == 0)
        formItem.accept(visitor: populateTableView)
        assert(populateTableView.cells.allItems.count == 1)
        guard let item: RFTableViewCellArrayItem = populateTableView.cells.allItems.first else {
            fatalError("Expected PopulateTableView to have created at least 1 item")
        }
        guard let cell: RFAmountCell = item.cell as? RFAmountCell else {
            fatalError("Expected firstItem.cell to be of type AmountCell")
        }
        return cell
    }

    func createNumberFormattter(fractionDigits: UInt8, decimalSeparator: String, groupingSeparator: String) -> NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.currencyCode = ""
        f.currencySymbol = ""
        f.currencyGroupingSeparator = ""
        f.perMillSymbol = ""
        f.groupingSeparator = groupingSeparator
        f.minimumFractionDigits = Int(fractionDigits)
        f.maximumFractionDigits = Int(fractionDigits)
        f.negativeSuffix = ""
        f.negativePrefix = "-"
        f.decimalSeparator = decimalSeparator
        return f
    }
}
