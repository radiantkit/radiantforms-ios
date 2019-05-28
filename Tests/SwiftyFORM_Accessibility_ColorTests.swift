// MIT license. Copyright (c) 2019 SwiftyFORM. All rights reserved.
import XCTest
import UIKit
@testable import SwiftyFORM


protocol UIAccessibility_IsDarkerSystemColorsEnabled {
    var isDarkerSystemColorsEnabled: Bool { get }
}

class Default_UIAccessibility_IsDarkerSystemColorsEnabled: UIAccessibility_IsDarkerSystemColorsEnabled {
    var isDarkerSystemColorsEnabled: Bool {
        return UIAccessibility.isDarkerSystemColorsEnabled
    }
}

class Mock_UIAccessibility_IsDarkerSystemColorsEnabled: UIAccessibility_IsDarkerSystemColorsEnabled {
    private let _isDarkerSystemColorsEnabled: Bool
    init(isDarkerSystemColorsEnabled: Bool) {
        self._isDarkerSystemColorsEnabled = isDarkerSystemColorsEnabled
    }
    
    var isDarkerSystemColorsEnabled: Bool {
        return self._isDarkerSystemColorsEnabled
    }
}

protocol Component {
    var color: UIColor { get }
}

class Leaf: Component {
    private let _color: UIColor
    
    init(color: UIColor) {
        self._color = color
    }
    
    var color: UIColor {
        return _color
    }
}

class InBrightContext: Component {
    private let inner: Component
    private let uiAccessibility_IsDarkerSystemColorsEnabled: UIAccessibility_IsDarkerSystemColorsEnabled
    init(inner: Component, uiAccessibility_IsDarkerSystemColorsEnabled: UIAccessibility_IsDarkerSystemColorsEnabled) {
        self.inner = inner
        self.uiAccessibility_IsDarkerSystemColorsEnabled = uiAccessibility_IsDarkerSystemColorsEnabled
    }
    
    var color: UIColor {
        if self.uiAccessibility_IsDarkerSystemColorsEnabled.isDarkerSystemColorsEnabled {
            return InBrightContext.darkened(inner.color)
        } else {
            return inner.color
        }
    }
    
    static func darkened(_ color: UIColor) -> UIColor {
        let factor: CGFloat = 0.5
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        r *= factor
        g *= factor
        b *= factor
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

class InDarkContext: Component {
    private let inner: Component
    private let uiAccessibility_IsDarkerSystemColorsEnabled: UIAccessibility_IsDarkerSystemColorsEnabled
    init(inner: Component, uiAccessibility_IsDarkerSystemColorsEnabled: UIAccessibility_IsDarkerSystemColorsEnabled) {
        self.inner = inner
        self.uiAccessibility_IsDarkerSystemColorsEnabled = uiAccessibility_IsDarkerSystemColorsEnabled
    }
    
    var color: UIColor {
        if self.uiAccessibility_IsDarkerSystemColorsEnabled.isDarkerSystemColorsEnabled {
            return InDarkContext.brightened(inner.color)
        } else {
            return inner.color
        }
    }
    
    static func brightened(_ color: UIColor) -> UIColor {
        let factor: CGFloat = 1.3
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        r *= factor
        g *= factor
        b *= factor
        if r > 1.0 { r = 1.0 }
        if g > 1.0 { g = 1.0 }
        if b > 1.0 { b = 1.0 }
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}




class SwiftyFORM_Accessibility_ColorTests: XCTestCase {
    func testInBrightContext() {
        func difference(_ input: UIColor, _ expected: UIColor) -> CGFloat {
            let color0: Component = Leaf(color: input)
            let mock: UIAccessibility_IsDarkerSystemColorsEnabled = Mock_UIAccessibility_IsDarkerSystemColorsEnabled(isDarkerSystemColorsEnabled: true)
            let color1: Component = InBrightContext(inner: color0, uiAccessibility_IsDarkerSystemColorsEnabled: mock)
            let actual: UIColor = color1.color
            return calculateDifference(actual, expected)
        }

        do {
            let diff: CGFloat = difference(UIColor.clear, UIColor.clear)
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.black, UIColor.black)
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.white, UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(
                UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5),
                UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.5)
            )
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.red, UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.green, UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.blue, UIColor(red: 0.0, green: 0.0, blue: 0.5, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
    }
    
    func testInDarkContext() {
        func difference(_ input: UIColor, _ expected: UIColor) -> CGFloat {
            let color0: Component = Leaf(color: input)
            let mock: UIAccessibility_IsDarkerSystemColorsEnabled = Mock_UIAccessibility_IsDarkerSystemColorsEnabled(isDarkerSystemColorsEnabled: true)
            let color1: Component = InDarkContext(inner: color0, uiAccessibility_IsDarkerSystemColorsEnabled: mock)
            let actual: UIColor = color1.color
            return calculateDifference(actual, expected)
        }
        
        do {
            let diff: CGFloat = difference(UIColor.clear, UIColor.clear)
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.black, UIColor.black)
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.white, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(
                UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5),
                UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 0.5)
            )
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.red, UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.green, UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = difference(UIColor.blue, UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0))
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
    }

    func calculateDifference(_ lhs: UIColor, _ rhs: UIColor) -> CGFloat {
        var (r0, g0, b0, a0): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        lhs.getRed(&r0, green: &g0, blue: &b0, alpha: &a0)
        rhs.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        let (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (r0 - r1, g0 - g1, b0 - b1, a0 - a1)
        return r * r + g * g + b * b + a * a
    }
    
    func testCalculateDifference() {
        do {
            let diff: CGFloat = calculateDifference(UIColor.black, UIColor.black)
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = calculateDifference(UIColor.white, UIColor.white)
            XCTAssertEqual(diff, 0, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = calculateDifference(UIColor.clear, UIColor.white)
            XCTAssertEqual(diff, 4, accuracy: 0.001)
        }
        do {
            let diff: CGFloat = calculateDifference(UIColor.red, UIColor.green)
            XCTAssertEqual(diff, 2, accuracy: 0.001)
        }
    }
}
