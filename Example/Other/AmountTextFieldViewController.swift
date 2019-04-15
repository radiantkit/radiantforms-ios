// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountTextFieldViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .none

        builder += SectionHeaderTitleFormItem().title("Amount TextFields")
        builder += amountTextField0
        builder += amountTextField1
        builder += amountTextField2
    }
    
    lazy var amountTextField0: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        return instance
    }()
    
    lazy var amountTextField1: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        return instance
    }()
    
    lazy var amountTextField2: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        return instance
    }()
}
