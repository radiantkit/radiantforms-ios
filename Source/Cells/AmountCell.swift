// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

public class AmountCellSizes {
    public let titleLabelFrame: CGRect
    public let textFieldFrame: CGRect
    public let cellHeight: CGFloat
    
    public init(titleLabelFrame: CGRect, textFieldFrame: CGRect, cellHeight: CGFloat) {
        self.titleLabelFrame = titleLabelFrame
        self.textFieldFrame = textFieldFrame
        self.cellHeight = cellHeight
    }
}

public struct AmountCellModel {
    var title: String = ""
    var toolbarMode: ToolbarMode = .simple
    var placeholder: String = ""
    var unitSuffix: String = ""
    var returnKeyType: UIReturnKeyType = .default
    var maxIntegerDigits: UInt8 = 10
    var fractionDigits: UInt8 = 3
    var model: AmountFormItem! = nil
    
    var valueDidChange: (AmountValue) -> Void = { (value: AmountValue) in
        SwiftyFormLog("value \(value)")
    }
    
    var maxIntegerAndFractionDigits: UInt {
        return UInt(self.maxIntegerDigits) + UInt(self.fractionDigits)
    }
}

public class AmountCell: UITableViewCell {
    private let amountFormatter: AmountFormatter

    public let model: AmountCellModel
    public let titleLabel = UILabel()
    public let textField = CustomAmountTextField()
    
    public init(model: AmountCellModel) {
        self.model = model
        self.amountFormatter = AmountFormatter(fractionDigits: model.fractionDigits)
        super.init(style: .default, reuseIdentifier: nil)
        
        self.addGestureRecognizer(tapGestureRecognizer)
        
        selectionStyle = .none
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textField.font  = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        textField.configure()
        textField.delegate = self

        textField.addTarget(self, action: #selector(AmountCell.valueDidChange), for: UIControl.Event.editingChanged)

        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        
        titleLabel.text = model.title
        textField.placeholder = model.placeholder
        textField.returnKeyType = model.returnKeyType
        
        if self.model.toolbarMode == .simple {
            textField.inputAccessoryView = toolbar
        }
        
//        titleLabel.backgroundColor = UIColor.blue
//        textField.backgroundColor = UIColor.green
//        rightView.backgroundColor = UIColor.blue
        clipsToBounds = true
        
        installRightView()
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - RightView, for unit indicators or currency codes
    
    private func installRightView() {
        let text: String = model.unitSuffix
        guard !text.isEmpty else {
            return
        }
        let label: UILabel = self.rightView
        label.font = textField.font
        textField.rightView = label
        textField.rightViewMode = .always
        label.text = text
        label.sizeToFit()
    }
    
    public lazy var rightView: UILabel = {
        let instance = EdgeInsetLabel(frame: .zero)
        instance.textColor = UIColor.black
        instance.textAlignment = .right
        instance.edgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return instance
    }()
    
    
    // MARK: - Toolbar, Prev/Next Buttons
    
    public lazy var toolbar: SimpleToolbar = {
        let instance = SimpleToolbar()
        weak var weakSelf = self
        instance.jumpToPrevious = {
            if let cell = weakSelf {
                cell.gotoPrevious()
            }
        }
        instance.jumpToNext = {
            if let cell = weakSelf {
                cell.gotoNext()
            }
        }
        instance.dismissKeyboard = {
            if let cell = weakSelf {
                cell.dismissKeyboard()
            }
        }
        return instance
    }()
    
    public func updateToolbarButtons() {
        if model.toolbarMode == .simple {
            toolbar.updateButtonConfiguration(self)
        }
    }
    
    public func gotoPrevious() {
        SwiftyFormLog("make previous cell first responder")
        form_makePreviousCellFirstResponder()
    }
    
    public func gotoNext() {
        SwiftyFormLog("make next cell first responder")
        form_makeNextCellFirstResponder()
    }
    
    public func dismissKeyboard() {
        SwiftyFormLog("dismiss keyboard")
        _ = resignFirstResponder()
    }
    
    @objc public func handleTap(_ sender: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    
    public lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let gr = UITapGestureRecognizer(target: self, action: #selector(AmountCell.handleTap(_:)))
        return gr
    }()
    
    public enum TitleWidthMode {
        case auto
        case assign(width: CGFloat)
    }
    
    public var titleWidthMode: TitleWidthMode = .auto
    
    public func compute() -> AmountCellSizes {
        let cellWidth: CGFloat = bounds.width
        
        var titleLabelFrame = CGRect.zero
        var textFieldFrame = CGRect.zero
        var cellHeight: CGFloat = 0
        let veryTallCell = CGRect(x: 0, y: 0, width: cellWidth, height: CGFloat.greatestFiniteMagnitude)
        
        var layoutMargins = self.layoutMargins
        layoutMargins.top = 0
        layoutMargins.bottom = 0
        let area = veryTallCell.inset(by: layoutMargins)
        
        let (topRect, _) = area.divided(atDistance: 44, from: .minYEdge)
        do {
            let size = titleLabel.sizeThatFits(area.size)
            var titleLabelWidth = size.width
            
            switch titleWidthMode {
            case .auto:
                break
            case let .assign(width):
                let w = CGFloat(width)
                if w > titleLabelWidth {
                    titleLabelWidth = w
                }
            }
            
            var (slice, remainder) = topRect.divided(atDistance: titleLabelWidth, from: .minXEdge)
            titleLabelFrame = slice
            (_, remainder) = remainder.divided(atDistance: 10, from: .minXEdge)
            remainder.size.width += 4
            textFieldFrame = remainder
            
            cellHeight = ceil(textFieldFrame.height)
        }
        
        return AmountCellSizes(titleLabelFrame: titleLabelFrame, textFieldFrame: textFieldFrame, cellHeight: cellHeight)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        //SwiftyFormLog("layoutSubviews")
        let sizes: AmountCellSizes = compute()
        titleLabel.frame = sizes.titleLabelFrame
        textField.frame = sizes.textFieldFrame
    }
    
    /// Remove all non-digits, such as symbols, whitespace, formatting.
    public static func extractDigitsFromString(_ formattedString: String) -> String {
        // Split the string by non-digit characters to an array of digits and the join them back to a string
        return formattedString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    public func createInternalValue(_ unformattedString: String) -> UInt64? {
        guard let internalValue: UInt64 = UInt64(unformattedString) else {
            SwiftyFormLog("Failed to create internalValue from string")
            return nil
        }
        return internalValue
    }
    
    public func formatAmount(_ internalValue: UInt64) -> String {
        let decimal0: Decimal = Decimal(internalValue)
        let negativeExponent: Int = -Int(self.model.fractionDigits)
        let decimal1: Decimal = Decimal(sign: .plus, exponent: negativeExponent, significand: decimal0)
        return self.amountFormatter.string(from: decimal1 as NSNumber) ?? ""
    }

    public func parseAndFormatAmount(_ value: AmountValue) -> String {
        if value == 0 {
            SwiftyFormLog("The value is zero")
            return ""
        }
        return self.formatAmount(value)
    }
    
    @objc public func valueDidChange() {
        let text: String = textField.text ?? ""
        let unformattedString: String = type(of: self).extractDigitsFromString(text)
        let internalValue: AmountValue = self.createInternalValue(unformattedString) ?? 0
        model.valueDidChange(internalValue)
    }
    
    public func setValueWithoutSync(_ value: AmountValue) {
        SwiftyFormLog("set value \(value)")
        let formattedValue: String = self.parseAndFormatAmount(value)
        textField.text = formattedValue
    }

    
    // MARK: UIResponder
    
    public override var canBecomeFirstResponder: Bool {
        return true
    }
    
    public override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    public override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
    
}

extension AmountCell: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        updateToolbarButtons()
        textField.text = textField.text?.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //SwiftyFormLog("enter. NSRange: \(range)   replacementString: '\(string)'")
        
        let currentText: String = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            SwiftyFormLog("ERROR: Unable to create Range from NSRange")
            return false
        }
        //SwiftyFormLog("stringRange: \(stringRange)   NSRange: \(range)   currentText: '\(currentText)'")

        let updatedText: String = currentText.replacingCharacters(in: stringRange, with: string)
        
        let unformattedString: String = type(of: self).extractDigitsFromString(updatedText)
        if unformattedString.isEmpty {
            return true
        }
        guard let internalValue: UInt64 = self.createInternalValue(unformattedString) else {
            SwiftyFormLog("Cannot create an internalValue")
            return false
        }
        if internalValue == 0 {
            textField.text = nil
            SwiftyFormLog("Show placeholder, when the internalValue is zero")
            valueDidChange()
            return false
        }
        
        let internalValueString: String = String(internalValue)
        guard internalValueString.count <= self.model.maxIntegerAndFractionDigits else {
            SwiftyFormLog("The internalValue must stay shorter than the max number of digits")
            return false
        }
        
        let s: String = self.formatAmount(internalValue)
        textField.text = s
        valueDidChange()
        
        //SwiftyFormLog("Leave.  s: '\(s)'")
        return false
    }
    
    // Hide the keyboard when the user taps the return key in this UITextField
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension AmountCell: CellHeightProvider {
    public func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        let sizes: AmountCellSizes = compute()
        let value = sizes.cellHeight
        //SwiftyFormLog("compute height of row: \(value)")
        return value
    }
}

fileprivate class AmountFormatter: NumberFormatter {
    /// `fractionDigits` is typically between 0 and 5
    init(fractionDigits: UInt8) {
        super.init()
        self.numberStyle = .decimal
        self.currencyCode = ""
        self.currencySymbol = ""
        self.currencyGroupingSeparator = ""
        self.perMillSymbol = ""
        self.groupingSeparator = ","
        self.minimumFractionDigits = Int(fractionDigits)
        self.maximumFractionDigits = Int(fractionDigits)
        self.negativeSuffix = ""
        self.negativePrefix = "-"
        self.decimalSeparator = "."
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class CustomAmountTextField: UITextField {
    public func configure() {
        backgroundColor = UIColor.white
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
        returnKeyType = .done
        clearButtonMode = .never
        isSecureTextEntry = false
        keyboardType = .numberPad
        textAlignment = .right
    }
}
