// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [],
            theme: SwiftyFORM_Theme.lightTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [AmountViewController_Light.self],
            theme: SwiftyFORM_Theme.lightTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [AmountViewController_Dark.self],
            theme: SwiftyFORM_Theme.darkTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [SignUpViewController_Light.self],
            theme: SwiftyFORM_Theme.lightTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [SignUpViewController_Dark.self],
            theme: SwiftyFORM_Theme.darkTheme()
        )

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
