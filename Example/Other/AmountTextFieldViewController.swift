// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountTextFieldViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .simple

        builder += SectionHeaderTitleFormItem().title("Examples")
        builder += soundLevel
        builder += numberOfTrees

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
    
    lazy var soundLevel: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Sound Level")
        instance.placeholder("0.0")
        instance.unitSuffix("dB")
        instance.fractionDigits(1)
        return instance
    }()
    
    lazy var numberOfTrees: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Number Of Trees")
        instance.placeholder("None")
        instance.unitSuffix("")
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var suffixDKK: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("DKK")
        instance.placeholder("0")
        instance.unitSuffix("DKK")
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var suffixEUR: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("EUR")
        instance.placeholder("0.00")
        instance.unitSuffix("EUR")
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var suffixEuroSymbol: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Symbol")
        instance.placeholder("0.0000")
        instance.unitSuffix("€")
        instance.fractionDigits(4)
        return instance
    }()
    
    lazy var noPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("No placeholder")
        instance.fractionDigits(3)
        return instance
    }()

    lazy var zeroPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Zero")
        instance.placeholder("0")
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var multiZeroPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Multi Zero")
        instance.placeholder("0.00")
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var xPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("X")
        instance.placeholder("x.xx")
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var requiredPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Required")
        instance.placeholder("Required")
        instance.fractionDigits(0)
        return instance
    }()
}
