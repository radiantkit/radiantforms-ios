// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

public protocol RFFontStrategy {
    func titleFont() -> RFFont
    func valueFont() -> RFFont
}

public class RFFontStrategy_Default: RFFontStrategy {
    public func titleFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
    
    public func valueFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
}

public class RFFontStrategy_BoldTitle: RFFontStrategy {
    public func titleFont() -> RFFont {
        return RFPreferredFontForTextStyle.headline
    }
    
    public func valueFont() -> RFFont {
        return RFPreferredFontForTextStyle.body
    }
}

/// UIViewController has no appearance proxy. This singleton serves the same purpose.
internal class RFFontStrategySingleton {
    static let shared = RFFontStrategySingleton()
    
    private typealias TypeName2FontStrategy = [String: RFFontStrategy]
    private var dict = TypeName2FontStrategy()
    
    func register(containerTypes: [UIAppearanceContainer.Type], theme: RFTheme) {
        guard containerTypes.count <= 1 else {
            print("ERROR: Expected containerTypes array to be exactly 1 element, but got more. Cannot register fontStrategy.")
            return
        }
        guard let firstContainerType: UIAppearanceContainer.Type = containerTypes.first else {
            print("ERROR: Expected containerTypesarray to be exactly 1 element, but got less. Cannot register fontStrategy.")
            return
        }
        guard let vctype = firstContainerType as? RFFormViewController.Type else {
            print("ERROR: Expected vc to be subclass of RFFormViewController. Cannot register fontStrategy.")
            return
        }
        
        let typename: String = String(describing: vctype)
        //print("typename: '\(typename)'")
        
        let fontStrategy: RFFontStrategy = theme.fontStrategy.resolveFontStrategy()
        //print("fontStrategy: '\(type(of: fontStrategy))'")
        
        self.dict[typename] = fontStrategy
        print("registered typename: '\(typename)'  fontStrategy: '\(type(of: fontStrategy))'")
    }
    
    func find(containerTypes: [UIAppearanceContainer.Type]) -> RFFontStrategy? {
        guard containerTypes.count <= 1 else {
            print("ERROR: Expected containerTypes array to be exactly 1 element, but got more. Cannot register fontStrategy.")
            return nil
        }
        guard let firstContainerType: UIAppearanceContainer.Type = containerTypes.first else {
            print("ERROR: Expected containerTypesarray to be exactly 1 element, but got less. Cannot register fontStrategy.")
            return nil
        }
        guard let vctype = firstContainerType as? RFFormViewController.Type else {
            print("ERROR: Expected vc to be subclass of RFFormViewController. Cannot register fontStrategy.")
            return nil
        }
        
        let typename: String = String(describing: vctype)
        //print("typename: '\(typename)'")
        
        let fontStrategyOrNil: RFFontStrategy? = self.dict[typename]
        return fontStrategyOrNil
    }
    
    func resolve(containerTypes: [UIAppearanceContainer.Type]) -> RFFontStrategy {
        let fontStrategyOrNil: RFFontStrategy? = self.find(containerTypes: containerTypes)
        if let fontStrategy: RFFontStrategy = fontStrategyOrNil {
            print("Resolve: Found registered fontStrategy. fontStrategy: '\(type(of: fontStrategy))'")
            return fontStrategy
        } else {
            print("No registered fontStrategy. Using default font strategy.")
            return RFFontStrategy_Default()
        }
    }
}
