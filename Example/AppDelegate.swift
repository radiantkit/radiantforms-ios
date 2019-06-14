// MIT license. Copyright (c) 2018 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            let builder = RFThemeBuilder.light
            builder.tintColor = UIColor.red
            builder.apply()
            builder.apply(AmountViewController_Light.self)
            builder.apply(SignUpViewController_Light.self)
        }
        do {
            let builder = RFThemeBuilder.dark
            builder.tintColor = UIColor.red
            builder.apply(AmountViewController_Dark.self)
            builder.apply(SignUpViewController_Dark.self)
        }

        let vc = FirstViewController()
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = UINavigationController(rootViewController: vc)
		window.tintColor = nil
		self.window = window
		window.makeKeyAndVisible()
		return true
	}

}
