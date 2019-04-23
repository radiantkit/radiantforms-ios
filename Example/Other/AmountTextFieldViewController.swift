// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountTextFieldViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .simple

        builder += SectionHeaderTitleFormItem().title("Typical usecases")
        builder += soundLevel
        builder += numberOfTrees
        builder += moneyDKK
        builder += moneyEUR
        builder += moneySymbol

        builder += SectionHeaderTitleFormItem().title("Placeholder")
        builder += noPlaceholder
        builder += zeroPlaceholder
        builder += multiZeroPlaceholder
        builder += xPlaceholder
        builder += requiredPlaceholder

        builder += SectionHeaderTitleFormItem().title("Initial Value")
        builder += initialValueValidA
        builder += initialValueValidB
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
    
    lazy var moneyDKK: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Money DKK")
        instance.placeholder("0")
        instance.unitSuffix("DKK")
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyEUR: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Money EUR")
        instance.placeholder("0.00")
        instance.unitSuffix("EUR")
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var moneySymbol: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Money Symbol")
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
    
    lazy var initialValueValidA: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("ValidA")
        instance.placeholder("value")
        instance.fractionDigits(0)
        instance.value = "12345"
        return instance
    }()

    lazy var initialValueValidB: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("ValidB")
        instance.placeholder("value")
        instance.fractionDigits(4)
        instance.value = "12345"
        return instance
    }()
}
