// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountFieldViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .simple

        builder += SectionHeaderTitleFormItem().title("Callbacks")
        builder += amountFieldWithCallback
        builder += callbackInfoTextView

        builder += SectionHeaderTitleFormItem().title("Buttons")
        builder += randomizeGoodButton
        builder += randomizeBadButton

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

    // MARK: - Assign random values
    
    lazy var randomizeGoodButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Randomize Good"
        instance.action = { [weak self] in
            self?.randomizeGood()
        }
        return instance
    }()
    
    func randomizeGood() {
        soundLevel.value = randomString(["", "0", "0.0", "0.1", "0.9", "3", "0,4"])
        numberOfTrees.value = randomString(["", "0", "3", "8"])
        moneyDKK.value = randomString(["", "1", "10", "99"])
        moneyEUR.value = randomString(["", "0.01", "2", "123.45", "333,33", "44444", "999.99"])
        moneySymbol.value = randomString(["", "0.0001", "1,222,3333", "1234.5678", "44440000", "9999.9999"])
    }
    
    lazy var randomizeBadButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Randomize Bad"
        instance.action = { [weak self] in
            self?.randomizeBad()
        }
        return instance
    }()
    
    func randomizeBad() {
        soundLevel.value = randomString(["-1", "garbage", " % ", "--", "$1", "?"])
        numberOfTrees.value = randomString(["-1", "-9", "-99"])
    }
    
    // MARK: - Typical usecases
    
    lazy var soundLevel: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Sound Level")
        instance.placeholder("0.0")
        instance.unitSuffix("dB")
        instance.maxIntegerDigits(0)
        instance.fractionDigits(1)
        return instance
    }()
    
    lazy var numberOfTrees: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Number Of Trees")
        instance.placeholder("None")
        instance.unitSuffix("")
        instance.maxIntegerDigits(1)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyDKK: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Money DKK")
        instance.placeholder("0")
        instance.unitSuffix("DKK")
        instance.maxIntegerDigits(2)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyEUR: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Money EUR")
        instance.placeholder("0.00")
        instance.unitSuffix("EUR")
        instance.maxIntegerDigits(3)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var moneySymbol: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Money Symbol")
        instance.placeholder("0.0000")
        instance.unitSuffix("€")
        instance.maxIntegerDigits(4)
        instance.fractionDigits(4)
        return instance
    }()
    
    lazy var noPlaceholder: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("No placeholder")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(3)
        return instance
    }()

    lazy var zeroPlaceholder: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Zero")
        instance.placeholder("0")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var multiZeroPlaceholder: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Multi Zero")
        instance.placeholder("0.00")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var xPlaceholder: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("X")
        instance.placeholder("x.xx")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var requiredPlaceholder: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Required")
        instance.placeholder("Required")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var initialValueValidA: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("ValidA")
        instance.placeholder("value")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        instance.value = "12345"
        return instance
    }()

    lazy var initialValueValidB: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("ValidB")
        instance.placeholder("value")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(4)
        instance.value = "12345"
        return instance
    }()

    lazy var amountFieldWithCallback: AmountFieldFormItem = {
        let instance = AmountFieldFormItem()
        instance.title("Callback")
        instance.placeholder("0")
        instance.maxIntegerDigits(3)
        instance.fractionDigits(3)
        instance.value = "12"
        
        instance.textDidChangeBlock = { [weak self] (value: String) in
            print("amountFieldWithCallback: text did change: \(value)")
            self?.callbackInfoTextView.value = "text did change: \(value)"
        }
        instance.textEditingEndBlock = { [weak self] (value: String) in
            print("amountFieldWithCallback: text editing end: \(value)")
            self?.callbackInfoTextView.value = "text editing end: \(value)"
        }
        return instance
    }()
    
    lazy var callbackInfoTextView: TextViewFormItem = {
        let instance = TextViewFormItem()
        instance.placeholder("Callback Info")
        return instance
    }()
}
