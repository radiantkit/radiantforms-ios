// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UITextField.appearance().tintColor = UIColor.purple
//        UITextField.appearance(whenContainedInInstancesOf: [AmountCell.self]).tintColor = UIColor.purple
//        UITextField.appearance(whenContainedInInstancesOf: [AmountCell.self]).textColor = UIColor.green
        UITableViewCell.appearance().backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        UITableView.appearance().backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        UITableView.appearance().separatorColor = UIColor(white: 0.8, alpha: 1.0)
        UILabel.appearance().textColor = .red
        
        FormTableView.configureAppearance(whenContainedInInstancesOf: [])
        
//        AmountCell.configureAppearance(whenContainedInInstancesOf: [])
        AmountCell.configureAppearance(whenContainedInInstancesOf: [AmountViewController.self])

        let vc = FirstViewController()
//        let vc = AmountViewController()
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = UINavigationController(rootViewController: vc)
		window.tintColor = nil
		self.window = window
		window.makeKeyAndVisible()
		return true
	}

}
