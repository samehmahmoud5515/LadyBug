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
    var rootNavigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureGoogleMaps()
        LanguageManager.shared.setDefaultlanguage(language: .ar)
        configureRootViewController()
        return true
    }
    
    private func configureGoogleMaps() {
        GMSServices.provideAPIKey("")
    }
    
    func configureRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = (!(AccessTokenManager.isAccessTokenEmpty)) ? TabBarViewController() : LoginViewController()
        rootNavigationController = UINavigationController(rootViewController: rootViewController)
        rootNavigationController?.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    
    func navigateToLogin() {
        rootNavigationController?.setViewControllers([LoginViewController()], animated: false)
    }
}
