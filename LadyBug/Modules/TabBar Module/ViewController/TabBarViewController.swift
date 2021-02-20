//
//  TabBarViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private var tabsNavigationController = [UINavigationController]()
    private let localizer = TabBarLoclizer()

    override func viewDidLoad() {
        super.viewDidLoad()        
        setupUI()
    }
    
    private func setupUI() {
        addHomeViewController()
        addMyFarmViewController()
        addVideosViewController()
        addProductsViewController()
        addProfileViewController()
        setupUITabBarItem()
        setupTabBarTintColor()
        viewControllers = tabsNavigationController
    }
    
    private func setupTabBarTintColor() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .midGreen
    }
    
    private func setupUITabBarItem() {
        UITabBarItem.appearance().setTitleTextAttributes(
        [
            NSAttributedString.Key.foregroundColor: UIColor.midGreen,
            NSAttributedString.Key.font: UIFont.get(enFont: .regular(10), arFont: .regular(10)),
        ], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes(
        [
            NSAttributedString.Key.foregroundColor: UIColor.silver,
            NSAttributedString.Key.font: UIFont.get(enFont: .regular(10), arFont: .regular(10))
        ], for: .normal)
    }
    
    private func addHomeViewController() {
        let homeVc = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        let item = UITabBarItem(title: localizer.home, image: UIImage(named: "tabBar_home_ic"), selectedImage: UIImage(named: "tabBar_home_ic"))
        
        homeVc.tabBarItem = item
        tabsNavigationController.append(navigationController)
    }
    
    private func addMyFarmViewController() {
        let farmVc = MyFarmViewController()
        let navigationController = UINavigationController(rootViewController: farmVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        let item = UITabBarItem(title: localizer.myFarm, image: UIImage(named: "tabBar_farm_ic"), selectedImage: UIImage(named: "tabBar_farm_ic"))
        
        farmVc.tabBarItem = item
        
        tabsNavigationController.append(navigationController)
    }
    
    private func addVideosViewController() {
        let videosVc = VideosViewController()
        let navigationController = UINavigationController(rootViewController: videosVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        let item = UITabBarItem(title: localizer.videos, image: UIImage(named: "tabBar_videos_ic"), selectedImage: UIImage(named: "tabBar_videos_ic"))
            
        videosVc.tabBarItem = item
        tabsNavigationController.append(navigationController)
    }
    
    private func addProductsViewController() {
        let productsVc = ProductsViewController()
        let navigationController = UINavigationController(rootViewController: productsVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        let item = UITabBarItem(title: localizer.products, image: UIImage(named: "tabBar_products_ic"), selectedImage: UIImage(named: "tabBar_products_ic"))
        
        productsVc.tabBarItem = item
        tabsNavigationController.append(navigationController)
    }
    
    private func addProfileViewController() {
        let profileVc = UIViewController()
        let navigationController = UINavigationController(rootViewController: profileVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        let item = UITabBarItem(title: localizer.profile, image: UIImage(named: "tabBar_profile_ic"), selectedImage: UIImage(named: "tabBar_profile_ic"))
        
        profileVc.tabBarItem = item
        tabsNavigationController.append(navigationController)
    }
    
}
