// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

class AmountViewController: FormViewController {
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Amounts"
        builder.toolbarMode = .simple

        builder += SectionHeaderTitleFormItem().title("Buttons")
        builder += randomizeGoodButton
        builder += randomizeBadButton
        builder += showValuesButton

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
        soundLevel.value = pickRandomAmountValue([0, 1, 3, 4, 9])
        numberOfTrees.value = pickRandomAmountValue([0, 3, 8])
        moneyDKK.value = pickRandomAmountValue([0, 1, 10, 99])
        moneyEUR.value = pickRandomAmountValue([0, 1, 2, 12345, 33333, 44444, 99999])
        moneySymbol.value = pickRandomAmountValue([0, 1, 12223333, 12345678, 44440000, 99999999])
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
        soundLevel.value = pickRandomAmountValue([10, 1000])
        numberOfTrees.value = pickRandomAmountValue([100, 10000])
    }
    
	func pickRandomAmountValue(_ values: [AmountValue]) -> AmountValue {
		return values.randomElement()!
	}

	// MARK: - Show Values

    lazy var showValuesButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "Show Values"
        instance.action = { [weak self] in
            self?.showValuesAction()
        }
        return instance
    }()
    
    func showValuesAction() {
        var strings = [String]()
        strings.append("soundLevel: \(self.soundLevel.value)")
        strings.append("numberOfTrees: \(self.numberOfTrees.value)")
        strings.append("moneyDKK: \(self.moneyDKK.value)")
        strings.append("moneyEUR: \(self.moneyEUR.value)")
        strings.append("moneySymbol: \(self.moneySymbol.value)")
        
        let body: String = strings.joined(separator: "\n")
        form_simpleAlert("Show Values", body)
    }
    
    // MARK: - Typical usecases
    
    lazy var soundLevel: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Sound Level")
        instance.placeholder("0.0")
        instance.unitSuffix("dB")
        instance.maxIntegerDigits(0)
        instance.fractionDigits(1)
        return instance
    }()
    
    lazy var numberOfTrees: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Number Of Trees")
        instance.placeholder("None")
        instance.unitSuffix("")
        instance.maxIntegerDigits(1)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyDKK: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Money DKK")
        instance.placeholder("0")
        instance.unitSuffix("DKK")
        instance.maxIntegerDigits(2)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var moneyEUR: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Money EUR")
        instance.placeholder("0.00")
        instance.unitSuffix("EUR")
        instance.maxIntegerDigits(3)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var moneySymbol: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Money Symbol")
        instance.placeholder("0.0000")
        instance.unitSuffix("€")
        instance.maxIntegerDigits(4)
        instance.fractionDigits(4)
        return instance
    }()
    
    lazy var noPlaceholder: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("No placeholder")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(3)
        return instance
    }()

    lazy var zeroPlaceholder: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Zero")
        instance.placeholder("0")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var multiZeroPlaceholder: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Multi Zero")
        instance.placeholder("0.00")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var xPlaceholder: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("X")
        instance.placeholder("x.xx")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(2)
        return instance
    }()
    
    lazy var requiredPlaceholder: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("Required")
        instance.placeholder("Required")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        return instance
    }()
    
    lazy var initialValueValidA: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("ValidA")
        instance.placeholder("value")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(0)
        instance.value = 12345
        return instance
    }()

    lazy var initialValueValidB: AmountFormItem = {
        let instance = AmountFormItem()
        instance.title("ValidB")
        instance.placeholder("value")
        instance.maxIntegerDigits(10)
        instance.fractionDigits(4)
        instance.value = 12345
        return instance
    }()
}