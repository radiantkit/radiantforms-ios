// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import Foundation

public class RFTextFormItem: RFFormItem {
    override func accept(visitor: RFFormItemVisitor) {
        visitor.visit(object: self)
    }
    
    public var text: String = ""
    
    @discardableResult
    public func text(_ text: String) -> Self {
        self.text = text
        return self
    }
}
