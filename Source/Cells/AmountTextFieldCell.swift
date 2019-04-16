// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit

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

public enum AmountTextCellState {
    case noMessage
    case temporaryMessage(message: String)
    case persistentMessage(message: String)
}

public class AmountTextFieldFormItemCellSizes {
    public let titleLabelFrame: CGRect
    public let textFieldFrame: CGRect
    public let errorLabelFrame: CGRect
    public let cellHeight: CGFloat
    
    public init(titleLabelFrame: CGRect, textFieldFrame: CGRect, errorLabelFrame: CGRect, cellHeight: CGFloat) {
        self.titleLabelFrame = titleLabelFrame
        self.textFieldFrame = textFieldFrame
        self.errorLabelFrame = errorLabelFrame
        self.cellHeight = cellHeight
    }
}

public struct AmountTextFieldFormItemCellModel {
    var title: String = ""
    var toolbarMode: ToolbarMode = .simple
    var placeholder: String = ""
    var unitSuffix: String = ""
    var returnKeyType: UIReturnKeyType = .default
    var fractionDigits: UInt8 = 3
    var model: AmountTextFieldFormItem! = nil
    
    var valueDidChange: (String) -> Void = { (value: String) in
        SwiftyFormLog("value \(value)")
    }
    
    var didEndEditing: (String) -> Void = { (value: String) in
        SwiftyFormLog("value \(value)")
    }
}

public class AmountTextFieldCell: UITableViewCell {
    private let amountFormatter: AmountFormatter

    public let model: AmountTextFieldFormItemCellModel
    public let titleLabel = UILabel()
    public let textField = CustomAmountTextField()
    public let errorLabel = UILabel()
    
    public var state: AmountTextCellState = .noMessage
    
    public init(model: AmountTextFieldFormItemCellModel) {
        self.model = model
        self.amountFormatter = AmountFormatter(fractionDigits: model.fractionDigits)
        super.init(style: .default, reuseIdentifier: nil)
        
        self.addGestureRecognizer(tapGestureRecognizer)
        
        selectionStyle = .none
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textField.font  = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        errorLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption2)
        
        errorLabel.textColor = UIColor.red
        errorLabel.numberOfLines = 0
        
        textField.configure()
        textField.delegate = self
        
        textField.addTarget(self, action: #selector(AmountTextFieldCell.valueDidChange), for: UIControl.Event.editingChanged)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        contentView.addSubview(errorLabel)
        
        titleLabel.text = model.title
        textField.placeholder = model.placeholder
        textField.returnKeyType = model.returnKeyType
        
        if self.model.toolbarMode == .simple {
            textField.inputAccessoryView = toolbar
        }
        
        updateErrorLabel(model.model.liveValidateValueText())
        
        //        titleLabel.backgroundColor = UIColor.blueColor()
        //        textField.backgroundColor = UIColor.greenColor()
        //        errorLabel.backgroundColor = UIColor.yellowColor()
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
        let gr = UITapGestureRecognizer(target: self, action: #selector(AmountTextFieldCell.handleTap(_:)))
        return gr
    }()
    
    public enum TitleWidthMode {
        case auto
        case assign(width: CGFloat)
    }
    
    public var titleWidthMode: TitleWidthMode = .auto
    
    public func compute() -> AmountTextFieldFormItemCellSizes {
        let cellWidth: CGFloat = bounds.width
        
        var titleLabelFrame = CGRect.zero
        var textFieldFrame = CGRect.zero
        var errorLabelFrame = CGRect.zero
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
        do {
            let size = errorLabel.sizeThatFits(area.size)
            //            SwiftyFormLog("error label size \(size)")
            if size.height > 0.1 {
                var r = topRect
                r.origin.y = topRect.maxY - 6
                let (slice, _) = r.divided(atDistance: size.height, from: .minYEdge)
                errorLabelFrame = slice
                cellHeight = ceil(errorLabelFrame.maxY + 10)
            }
        }
        
        return AmountTextFieldFormItemCellSizes(titleLabelFrame: titleLabelFrame, textFieldFrame: textFieldFrame, errorLabelFrame: errorLabelFrame, cellHeight: cellHeight)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        //SwiftyFormLog("layoutSubviews")
        let sizes: AmountTextFieldFormItemCellSizes = compute()
        titleLabel.frame = sizes.titleLabelFrame
        textField.frame = sizes.textFieldFrame
        errorLabel.frame = sizes.errorLabelFrame
    }
    
    @objc public func valueDidChange() {
        model.valueDidChange(textField.text ?? "")
        
        let result: ValidateResult = model.model.liveValidateValueText()
        switch result {
        case .valid:
            SwiftyFormLog("valid")
        case .hardInvalid:
            SwiftyFormLog("hard invalid")
        case .softInvalid:
            SwiftyFormLog("soft invalid")
        }
    }
    
    public func setValueWithoutSync(_ value: String) {
        SwiftyFormLog("set value \(value)")
        textField.text = value
        _ = validateAndUpdateErrorIfNeeded(value, shouldInstallTimer: false, checkSubmitRule: false)
    }
    
    public func updateErrorLabel(_ result: ValidateResult) {
        switch result {
        case .valid:
            errorLabel.text = nil
        case .hardInvalid(let message):
            errorLabel.text = message
        case .softInvalid(let message):
            errorLabel.text = message
        }
    }
    
    public var lastResult: ValidateResult?
    
    public var hideErrorMessageAfterFewSecondsTimer: Timer?
    public func invalidateTimer() {
        if let timer = hideErrorMessageAfterFewSecondsTimer {
            timer.invalidate()
            hideErrorMessageAfterFewSecondsTimer = nil
        }
    }
    
    public func installTimer() {
        invalidateTimer()
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(AmountTextFieldCell.timerUpdate), userInfo: nil, repeats: false)
        hideErrorMessageAfterFewSecondsTimer = timer
    }
    
    // Returns true  when valid
    // Returns false when invalid
    public func validateAndUpdateErrorIfNeeded(_ text: String, shouldInstallTimer: Bool, checkSubmitRule: Bool) -> Bool {
        
        let tableView: UITableView? = form_tableView()
        
        let result: ValidateResult = model.model.validateText(text, checkHardRule: true, checkSoftRule: true, checkSubmitRule: checkSubmitRule)
        if let lastResult = lastResult {
            if lastResult == result {
                switch result {
                case .valid:
                    //SwiftyFormLog("same valid")
                    return true
                case .hardInvalid:
                    //SwiftyFormLog("same hard invalid")
                    invalidateTimer()
                    if shouldInstallTimer {
                        installTimer()
                    }
                    return false
                case .softInvalid:
                    //SwiftyFormLog("same soft invalid")
                    invalidateTimer()
                    if shouldInstallTimer {
                        installTimer()
                    }
                    return true
                }
            }
        }
        lastResult = result
        
        switch result {
        case .valid:
            //SwiftyFormLog("different valid")
            if let tv = tableView {
                tv.beginUpdates()
                errorLabel.text = nil
                setNeedsLayout()
                tv.endUpdates()
                
                invalidateTimer()
            }
            return true
        case let .hardInvalid(message):
            //SwiftyFormLog("different hard invalid")
            if let tv = tableView {
                tv.beginUpdates()
                errorLabel.text = message
                setNeedsLayout()
                tv.endUpdates()
                
                invalidateTimer()
                if shouldInstallTimer {
                    installTimer()
                }
            }
            return false
        case let .softInvalid(message):
            //SwiftyFormLog("different soft invalid")
            if let tv = tableView {
                tv.beginUpdates()
                errorLabel.text = message
                setNeedsLayout()
                tv.endUpdates()
                
                invalidateTimer()
                if shouldInstallTimer {
                    installTimer()
                }
            }
            return true
        }
    }
    
    @objc public func timerUpdate() {
        invalidateTimer()
        //SwiftyFormLog("timer update")
        
        let s = textField.text ?? ""
        _ = validateAndUpdateErrorIfNeeded(s, shouldInstallTimer: false, checkSubmitRule: false)
    }
    
    public func reloadPersistentValidationState() {
        invalidateTimer()
        //SwiftyFormLog("reload persistent message")
        
        let s = textField.text ?? ""
        _ = validateAndUpdateErrorIfNeeded(s, shouldInstallTimer: false, checkSubmitRule: true)
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

extension AmountTextFieldCell: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        updateToolbarButtons()
        textField.text = textField.text?.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText: String = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            SwiftyFormLog("Unable to create Range from NSRange")
            return false
        }
        
        let updatedText0: String = currentText.replacingCharacters(in: stringRange, with: string)
        let updatedText1: String = updatedText0.replacingOccurrences(of: ",", with: "")
        let updatedText2: String = updatedText1.replacingOccurrences(of: ".", with: "")
        let updatedText: String = updatedText2

        guard let uint64Value: UInt64 = UInt64(updatedText) else {
            return false
        }
        if uint64Value == 0 {
            textField.text = nil
            return false
        }
        let decimal0: Decimal = Decimal(uint64Value)
        
        let negativeExponent: Int = -Int(self.model.fractionDigits)
        let decimal1: Decimal = Decimal(sign: .plus, exponent: negativeExponent, significand: decimal0)
        let s: String = self.amountFormatter.string(from: decimal1 as NSNumber) ?? ""
        
        textField.text = s
        return false
    }
    
    // Hide the keyboard when the user taps the return key in this UITextField
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let s = textField.text ?? ""
        let isTextValid = validateAndUpdateErrorIfNeeded(s, shouldInstallTimer: true, checkSubmitRule: true)
        if isTextValid {
            textField.resignFirstResponder()
            model.didEndEditing(s)
        }
        return false
    }
}

extension AmountTextFieldCell: CellHeightProvider {
    public func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        let sizes: AmountTextFieldFormItemCellSizes = compute()
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
        self.groupingSeparator = ""
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
