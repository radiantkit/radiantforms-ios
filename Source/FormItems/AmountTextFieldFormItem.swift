// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import Foundation

public class AmountTextFieldFormItem: FormItem {
    override func accept(visitor: FormItemVisitor) {
        visitor.visit(object: self)
    }
}

