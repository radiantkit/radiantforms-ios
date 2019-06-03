// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let builder = SwiftyFORM_ThemeBuilder()
        builder.tintColor = UIColor.red
        builder.apply()

        
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [],
            theme: RFTheme.lightTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [AmountViewController_Light.self],
            theme: RFTheme.lightTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [AmountViewController_Dark.self],
            theme: RFTheme.darkTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [SignUpViewController_Light.self],
            theme: RFTheme.lightTheme()
        )
        FormTableView.configureAppearance(
            whenContainedInInstancesOf: [SignUpViewController_Dark.self],
            theme: RFTheme.darkTheme()
        )

        let vc = FirstViewController()
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = UINavigationController(rootViewController: vc)
		window.tintColor = nil
		self.window = window
		window.makeKeyAndVisible()
		return true
	}

}
