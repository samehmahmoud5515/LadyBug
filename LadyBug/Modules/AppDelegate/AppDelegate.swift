//
//  AppDelegate.swift
//  LadyBug
//
//  Created by Sameh on 2/14/21.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureGoogleMaps()
        LanguageManager.shared.setDefaultlanguage(language: .ar)
        configureRootViewController()
        Defaults[.username] = "admin@google.com"
        Defaults[.password] = "12345678"
        return true
    }
    
    private func configureGoogleMaps() {
        GMSServices.provideAPIKey("AIzaSyBr3c-6QjeizszKa59wNfx5GiZYZd26UGA")
    }
    
    func configureRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = (!(AccessTokenManager.isAccessTokenEmpty)) ? TabBarViewController() : LoginViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
