//
//  AppDelegate.swift
//  ProductsMeLi
//
//  Created by David Molina on 20/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initialSetup(application: application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}

private extension AppDelegate {
    
    func initialSetup(application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setInitialController()
    }

    func setInitialController() {
        guard #available(iOS 13, *) else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            let navigationController = UINavigationController(rootViewController: SearchProductFactory.getSearchProductViewController())
            window?.rootViewController = navigationController
            return
        }
    }

}
