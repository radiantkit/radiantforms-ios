// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountTextFieldViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .simple

        builder += SectionHeaderTitleFormItem().title("Suffix")
        builder += suffixDKK
        builder += suffixEUR
        builder += suffixEuroSymbol

        builder += SectionHeaderTitleFormItem().title("Placeholder")
        builder += noPlaceholder
        builder += zeroPlaceholder
        builder += multiZeroPlaceholder
        builder += xPlaceholder
        builder += requiredPlaceholder
    }
    
    lazy var suffixDKK: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("DKK")
        instance.placeholder("0.00")
        instance.unitSuffix("DKK")
        return instance
    }()
    
    lazy var suffixEUR: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("EUR")
        instance.placeholder("0.00")
        instance.unitSuffix("EUR")
        return instance
    }()
    
    lazy var suffixEuroSymbol: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Symbol")
        instance.placeholder("0.00")
        instance.unitSuffix("€")
        return instance
    }()
    
    lazy var noPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("No placeholder")
        return instance
    }()

    lazy var zeroPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Zero")
        instance.placeholder("0")
        return instance
    }()
    
    lazy var multiZeroPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Multi Zero")
        instance.placeholder("0.00")
        return instance
    }()
    
    lazy var xPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("X")
        instance.placeholder("x.xx")
        return instance
    }()
    
    lazy var requiredPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Required")
        instance.placeholder("Required")
        return instance
    }()
}
