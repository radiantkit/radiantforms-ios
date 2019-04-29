// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountTextFieldViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .simple

        builder += SectionHeaderTitleFormItem().title("Buttons")
        builder += randomizeButton

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
    
    lazy var randomizeButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Randomize"
        instance.action = { [weak self] in
            self?.randomize()
        }
        return instance
    }()
    
    func randomize() {
        soundLevel.value = randomString(["", "0", "0.0", "0.1", "0.9"])
        numberOfTrees.value = randomString(["", "0", "3", "8"])
        moneyDKK.value = randomString(["", "1", "10", "99"])
        moneyEUR.value = randomString(["", "0.01", "123.45", "999.99"])
        moneySymbol.value = randomString(["", "0.0001", "1234.5678", "9999.9999"])
    }
    
    lazy var soundLevel: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Sound Level")
        instance.placeholder("0.0")
        instance.unitSuffix("dB")
        instance.maxIntegerDigits(0)
        instance.fractionDigits(1)
        return instance
    }()
    
    lazy var numberOfTrees: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Number Of Trees")
        instance.placeholder("None")
        instance.unitSuffix("")
        instance.maxIntegerDigits(1)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyDKK: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Money DKK")
        instance.placeholder("0")
        instance.unitSuffix("DKK")
        instance.maxIntegerDigits(2)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyEUR: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Money EUR")
        instance.placeholder("0.00")
        instance.unitSuffix("EUR")
        instance.maxIntegerDigits(3)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var moneySymbol: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Money Symbol")
        instance.placeholder("0.0000")
        instance.unitSuffix("€")
        instance.maxIntegerDigits(4)
        instance.fractionDigits(4)
        return instance
    }()
    
    lazy var noPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("No placeholder")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(3)
        return instance
    }()

    lazy var zeroPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Zero")
        instance.placeholder("0")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var multiZeroPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Multi Zero")
        instance.placeholder("0.00")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var xPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("X")
        instance.placeholder("x.xx")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var requiredPlaceholder: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("Required")
        instance.placeholder("Required")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var initialValueValidA: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("ValidA")
        instance.placeholder("value")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        instance.value = "12345"
        return instance
    }()

    lazy var initialValueValidB: AmountTextFieldFormItem = {
        let instance = AmountTextFieldFormItem()
        instance.title("ValidB")
        instance.placeholder("value")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(4)
        instance.value = "12345"
        return instance
    }()
}
