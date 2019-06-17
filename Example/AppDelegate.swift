// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import RadiantForms

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            let builder = RFThemeBuilder.light
            builder.apply()
        }
		do {
			let builder = RFThemeBuilder.dark
			builder.applyTo(AmountViewController_DarkDefault.self)
			builder.applyTo(SignUpViewController_DarkDefault.self)
		}
        do {
            let builder = RFThemeBuilder.light
            builder.tintColor = UIColor.green
            builder.useTintFirstResponderStrategy()
            builder.applyTo(AmountViewController_LightFun.self)
            builder.applyTo(SignUpViewController_LightFun.self)
        }
        do {
            let builder = RFThemeBuilder.dark
            builder.tintColor = UIColor.orange
            builder.useTintFirstResponderStrategy()
            builder.applyTo(AmountViewController_DarkFun.self)
            builder.applyTo(SignUpViewController_DarkFun.self)
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
