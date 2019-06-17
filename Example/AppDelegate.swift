// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            let builder = RFThemeBuilder.light
            builder.tintColor = UIColor.red
            builder.apply()
            builder.applyTo(AmountViewController_Light.self)
            builder.applyTo(SignUpViewController_Light.self)
        }
        do {
            let builder = RFThemeBuilder.dark
            builder.tintColor = UIColor.red
            builder.applyTo(AmountViewController_Dark.self)
            builder.applyTo(SignUpViewController_Dark.self)
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
