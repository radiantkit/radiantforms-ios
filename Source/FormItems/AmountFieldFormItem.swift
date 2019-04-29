// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import Foundation

public class AmountFieldFormItem: FormItem {
    override func accept(visitor: FormItemVisitor) {
        visitor.visit(object: self)
    }
    
    public var returnKeyType: UIReturnKeyType = .default
    
    @discardableResult
    public func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self {
        self.returnKeyType = returnKeyType
        return self
    }
    
    public typealias SyncBlock = (_ value: String) -> Void
    public var syncCellWithValue: SyncBlock = { (string: String) in
        SwiftyFormLog("sync is not overridden")
    }
    
    internal var innerValue: String = ""
    public var value: String {
        get {
            return self.innerValue
        }
        set {
            self.assignValueAndSync(newValue)
        }
    }
    
    public func assignValueAndSync(_ value: String) {
        innerValue = value
        syncCellWithValue(value)
    }
    
    public var obtainTitleWidth: () -> CGFloat = {
        return 0
    }
    
    public var assignTitleWidth: (CGFloat) -> Void = { (width: CGFloat) in
        // do nothing
    }
    
    public var placeholder: String = ""
    
    @discardableResult
    public func placeholder(_ placeholder: String) -> Self {
        self.placeholder = placeholder
        return self
    }

    public var maxIntegerDigits: UInt8 = 10
    
    @discardableResult
    public func maxIntegerDigits(_ count: UInt8) -> Self {
        self.maxIntegerDigits = count
        return self
    }

    public var fractionDigits: UInt8 = 3
    
    @discardableResult
    public func fractionDigits(_ fractionDigits: UInt8) -> Self {
        self.fractionDigits = fractionDigits
        return self
    }

    public var title: String = ""
    
    @discardableResult
    public func title(_ title: String) -> Self {
        self.title = title
        return self
    }

    public var unitSuffix: String = ""
    
    @discardableResult
    public func unitSuffix(_ unitSuffix: String) -> Self {
        self.unitSuffix = unitSuffix
        return self
    }
}
